part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();
}

final class ProfileInitial extends ProfileState {
  @override
  List<Object> get props => [];
}

final class ProfileLoading extends ProfileState {
  @override
  List<Object?> get props => [];
}

final class ProfileError extends ProfileState {
  final String message;

  const ProfileError(this.message);

  @override
  List<Object?> get props => [message];
}

final class ProfileSuccess extends ProfileState {
  final UserModel user;

  const ProfileSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

final class ProfileUpdateSuccess extends ProfileState {
  @override
  List<Object?> get props => [];
}

final class CannotUpdateLocalProfileData extends ProfileState {
  final String message;

  const CannotUpdateLocalProfileData(this.message);

  @override
  List<Object?> get props => [message];
}

final class ProfileDeleteSuccess extends ProfileState {
  @override
  List<Object?> get props => [];
}
