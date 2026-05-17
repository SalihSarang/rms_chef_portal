import 'package:rms_shared_package/models/staff_model/staff_model.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {
  final bool isInitialCheck;

  AuthLoading({this.isInitialCheck = false});
}

class Authenticated extends AuthState {
  final StaffModel user;

  Authenticated(this.user);
}

class UnAuthenticated extends AuthState {}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}

class FormEditingState extends AuthState {
  final String email;
  final String password;
  final bool isPasswordVisible;

  FormEditingState({
    required this.email,
    required this.password,
    required this.isPasswordVisible,
  });
}
