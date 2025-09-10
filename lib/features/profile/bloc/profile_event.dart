part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class OnUpdateProfileOpen extends ProfileEvent {
  @override
  List<Object?> get props => [];
}

class UpdateProfileButtonClicked extends ProfileEvent {
  final UpdateProfileParameters params;

  const UpdateProfileButtonClicked(this.params);

  @override
  List<Object?> get props => [params];
}

class DeleteProfileButtonClicked extends ProfileEvent {
  @override
  List<Object?> get props => [];
}

class ResetPasswordAction extends ProfileEvent {
  final String currentPassword;
  final String newPassword;

  const ResetPasswordAction(this.currentPassword, this.newPassword);

  @override
  List<Object?> get props => [currentPassword, newPassword];
}
