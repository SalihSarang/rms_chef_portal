abstract class AuthEvent {}

class CheckAuthEvent extends AuthEvent {}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;

  SignInEvent(this.email, this.password);
}

class SignOutEvent extends AuthEvent {}

class LoginEmailChanged extends AuthEvent {
  final String email;
  LoginEmailChanged(this.email);
}

class LoginPasswordChanged extends AuthEvent {
  final String password;
  LoginPasswordChanged(this.password);
}

class LoginPasswordVisibilityChanged extends AuthEvent {
  LoginPasswordVisibilityChanged();
}
