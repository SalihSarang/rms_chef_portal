import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/check_auth_status.dart';
import '../../domain/usecases/sign_in_chef.dart';
import '../../domain/usecases/sign_out_chef.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInChef _signInChef;
  final SignOutChef _signOutChef;
  final CheckAuthStatus _checkAuthStatus;

  AuthBloc({
    required SignInChef signInChef,
    required SignOutChef signOutChef,
    required CheckAuthStatus checkAuthStatus,
  }) : _signInChef = signInChef,
       _signOutChef = signOutChef,
       _checkAuthStatus = checkAuthStatus,
       super(AuthInitial()) {
    on<CheckAuthEvent>(_onCheckAuthEvent);
    on<SignInEvent>(_onSignInEvent);
    on<SignOutEvent>(_onSignOutEvent);
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginPasswordVisibilityChanged>(_onPasswordVisibleChanged);
  }

  String _email = '';
  String _password = '';
  bool _isPasswordVisible = false;

  FormEditingState get currentFormState => _currentEditingState();

  FormEditingState _currentEditingState() {
    return FormEditingState(
      email: _email,
      password: _password,
      isPasswordVisible: _isPasswordVisible,
    );
  }

  void _onEmailChanged(LoginEmailChanged event, Emitter<AuthState> emit) {
    _email = event.email;
    emit(_currentEditingState());
  }

  void _onPasswordChanged(LoginPasswordChanged event, Emitter<AuthState> emit) {
    _password = event.password;
    emit(_currentEditingState());
  }

  void _onPasswordVisibleChanged(
    LoginPasswordVisibilityChanged event,
    Emitter<AuthState> emit,
  ) {
    _isPasswordVisible = !_isPasswordVisible;
    emit(_currentEditingState());
  }

  Future<void> _onCheckAuthEvent(
    CheckAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading(isInitialCheck: true));
    try {
      final user = await _checkAuthStatus();
      if (user != null) {
        emit(Authenticated(user));
      } else {
        emit(UnAuthenticated());
      }
    } catch (e) {
      emit(UnAuthenticated());
    }
  }

  Future<void> _onSignInEvent(
    SignInEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading(isInitialCheck: false));
    try {
      final user = await _signInChef(event.email, event.password);
      if (user != null) {
        emit(Authenticated(user));
      } else {
        emit(AuthError('Failed to sign in. Please try again.'));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onSignOutEvent(
    SignOutEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading(isInitialCheck: false));
    try {
      await _signOutChef();
      emit(UnAuthenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
