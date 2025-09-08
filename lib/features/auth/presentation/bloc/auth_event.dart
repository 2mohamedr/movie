part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class SubmitLoginForm extends AuthEvent {
  final String email;
  final String password;

  const SubmitLoginForm(this.email, this.password);
  @override
  List<Object> get props => [email, password];
}

final class ValidatorLoginForm extends AuthEvent {
  final String email;
  final String password;

  const ValidatorLoginForm(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

//
final class RegisterEvent extends AuthEvent {
  final String name;
  final String email;
  final String phone;
  final String password;
  final String confirmPassword;

  const RegisterEvent(
    this.name,
    this.email,
    this.phone,
    this.password,
    this.confirmPassword,
  );
  @override
  List<Object> get props => [name, email, phone, password, confirmPassword];
}
