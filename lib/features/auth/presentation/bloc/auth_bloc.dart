import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/failure/failure.dart';
import 'package:movies_app/core/network/auth/request.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/models/user_model.dart';
import '../../../../core/params/register_parameters.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SubmitLoginForm>(_onSubmitLoginForm);
    on<RegisterEvent>(_registerEvent);
  }
  //
  Future<void> _onSubmitLoginForm(
    SubmitLoginForm event,
    Emitter<AuthState> emit,
  ) async {
    final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
    final strongPasswordRegex = RegExp(
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
    );
    if (event.email.isEmpty) {
      emit(
        AuthFailure(
          Failure(
            statusCode: "VALIDATION_ERROR",
            message: "Email cannot be empty",
          ),
        ),
      );
      return;
    }
    if (!emailRegex.hasMatch(event.email)) {
      emit(
        AuthFailure(
          Failure(statusCode: "VALIDATION_ERROR", message: "Email not valid"),
        ),
      );
      return;
    }
    if (event.password.isEmpty) {
      emit(
        AuthFailure(
          Failure(
            statusCode: "VALIDATION_ERROR",
            message: "Password cannot be empty",
          ),
        ),
      );
      return;
    }
    if (!strongPasswordRegex.hasMatch(event.password)) {
      emit(
        AuthFailure(
          Failure(
            statusCode: "VALIDATION_ERROR",
            message: "Password not valid",
          ),
        ),
      );
      return;
    }
    emit(AuthLoading());
    final res = await Request.checkLoginInfo(event.email, event.password);
    await res.fold(
      (l) {
        emit(AuthFailure(l));
      },
      (r) async {
        await _getProfileInfo(token: r, emit: emit);
      },
    );
  }

  Future<void> _getProfileInfo({
    required String token,
    required Emitter<AuthState> emit,
  }) async {
    final res = await Request.getProfile(token);

    await res.fold(
      (l) {
        emit(AuthFailure(l));
      },
      (r) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("user_detail", jsonEncode(r.toJson()));
        emit(AuthSuccess(r));
      },
    );
  }

  //
  Future<void> _registerEvent(
    RegisterEvent event,
    Emitter<AuthState> emit,
  ) async {
    final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
    final strongPasswordRegex = RegExp(
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
    );
    if (event.name.isEmpty) {
      emit(
        AuthFailure(
          Failure(
            statusCode: "VALIDATION_ERROR",
            message: "Name cannot be empty",
          ),
        ),
      );
      return;
    }
    if (!emailRegex.hasMatch(event.email)) {
      emit(
        AuthFailure(
          Failure(statusCode: "VALIDATION_ERROR", message: "Email no Valid"),
        ),
      );
      return;
    }
    if (!strongPasswordRegex.hasMatch(event.password)) {
      emit(
        AuthFailure(
          Failure(statusCode: "VALIDATION_ERROR", message: "Email no Valid"),
        ),
      );
      return;
    }
    if (event.password != event.confirmPassword) {
      emit(
        AuthFailure(
          Failure(
            statusCode: "VALIDATION_ERROR",
            message: "Password doesn't Math Password Confirmation",
          ),
        ),
      );
      return;
    }
    if (event.phone.isEmpty) {
      emit(
        AuthFailure(
          Failure(
            statusCode: "VALIDATION_ERROR",
            message: "Phone cannot be Empty",
          ),
        ),
      );
      return;
    }
    emit(AuthLoading());
    final response = await Request.register(
      RegisterParameters(
        name: event.name,
        email: event.email,
        phone: event.phone,
        password: event.password,
        confirmPassword: event.confirmPassword,
      ),
    );
    response.fold((l) => emit(AuthFailure(l)), (r) {
      if (r) {
        emit(AuthRegisterSuccess());
      } else {
        emit(
          AuthFailure(
            Failure(
              statusCode: "VALIDATION_ERROR",
              message: "Unexpected Error",
            ),
          ),
        );
      }
    });
  }
}
