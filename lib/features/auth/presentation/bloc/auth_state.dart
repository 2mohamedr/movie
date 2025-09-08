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

final class AuthGetProfileSuccess extends AuthState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

final class AuthFailure extends AuthState {
  final Failure fail;

  const AuthFailure(this.fail);

  @override
  // TODO: implement props
  List<Object?> get props => [fail];
}
