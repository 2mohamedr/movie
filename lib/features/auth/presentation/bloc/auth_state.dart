part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();
}

final class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

final class AuthLoading extends AuthState {
  @override
  List<Object?> get props => [];
}

final class AuthSuccess extends AuthState {
  final UserModel user;

  const AuthSuccess(this.user);
  @override
  List<Object?> get props => [user];
}

final class AuthRegisterSuccess extends AuthState {
  @override
  List<Object?> get props => [];
}

final class AuthFailure extends AuthState {
  final Failure fail;

  const AuthFailure(this.fail);

  @override
  List<Object?> get props => [fail];
}
