import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/models/user_model.dart';
import 'package:movies_app/core/network/auth/request.dart';
import 'package:movies_app/core/network/core/profile/profile_request.dart';
import 'package:movies_app/core/params/update_profile_parameters.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) {});
    on<OnUpdateProfileOpen>(_getProfileFromShared);
    on<UpdateProfileButtonClicked>(_updateProfileFromApiAndShared);
    on<DeleteProfileButtonClicked>(_deleteAccountAndLogout);
    on<ResetPasswordAction>(_resetProfilePassword);
  }

  Future<void> _getProfileFromShared(
    OnUpdateProfileOpen event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString("user_detail");
    if (data != null) {
      emit(ProfileSuccess(UserModel.fromJson(jsonDecode(data))));
    } else {
      emit(ProfileError("Cannot get User Data"));
    }
  }

  FutureOr<void> _updateProfileFromApiAndShared(
    UpdateProfileButtonClicked event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString("user_detail") != null) {
      final UserModel user = UserModel.fromJson(
        jsonDecode(prefs.getString("user_detail")!),
      );
      if (user.token == null) {
        emit(ProfileError("Cannot get Profile Please Re Log-In"));
        return;
      }
      final response = await ProfileRequest.updateProfileRequest(
        event.params,
        user.token!,
      );

      await response.fold<Future<void>>(
        (l) async {
          emit(ProfileError(l.message));
        },
        (r) async {
          if (r) {
            final res = await Request.getProfile(user.token!);
            await res.fold<Future<void>>(
              (l) async {
                emit(CannotUpdateLocalProfileData(l.message));
              },
              (r) async {
                await prefs.setString("user_detail", jsonEncode(r));
                emit(ProfileSuccess(r));
              },
            );
          } else {
            emit(ProfileError("Cannot Update Profile, Try Again later..."));
          }
          // if (r) {
          //   Request.getProfile(user.token!).then((value) {
          //     value.fold((l) => emit(CannotUpdateLocalProfileData(l.message)), (
          //       r,
          //     ) async {
          //       await prefs.setString("user_detail", jsonEncode(r));
          //       emit(ProfileSuccess(user));
          //     });
          //   });
          // } else {
          //   emit(ProfileError("Cannot Update Profile, Try Again later..."));
          // }
        },
      );
    }
  }

  FutureOr<void> _deleteAccountAndLogout(
    DeleteProfileButtonClicked event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    final prefs = await SharedPreferences.getInstance();
    final user = UserModel.fromJson(
      jsonDecode(prefs.getString("user_detail")!),
    );
    final res = await ProfileRequest.deleteProfileRequest(user.token!);
    await res.fold(
      (l) {
        emit(ProfileError(l.message));
      },
      (r) async {
        if (r) {
          await prefs.clear();
          emit(ProfileDeleteSuccess());
        } else {
          emit(ProfileError("Unknown Error"));
        }
      },
    );
  }

  FutureOr<void> _resetProfilePassword(
    ResetPasswordAction event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    final prefs = await SharedPreferences.getInstance();
    final jsonUser = prefs.getString("user_detail");
    if (jsonUser != null) {
      final user = UserModel.fromJson(jsonDecode(jsonUser));
      final res = await ProfileRequest.resetProfilePasswordRequest(
        event.currentPassword,
        event.newPassword,
        user.token!,
      );
      res.fold(
        (l) => emit(ProfileError(l.message)),
        (r) => emit(ProfileUpdateSuccess()),
      );
    }
  }
}
