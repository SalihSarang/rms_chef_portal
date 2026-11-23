import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import 'package:chef_portal/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:chef_portal/features/auth/presentation/bloc/auth_event.dart';
import 'package:chef_portal/features/auth/presentation/widgets/auth_text_field.dart';
import 'auth_header.dart';
import 'login_email_field.dart';
import 'login_password_field.dart';
import 'sign_in_button.dart';

/// The main content of the login form, organized as a single column of
/// interactive components, including demo credential support.
class LoginFormBody extends StatefulWidget {
  /// The form key required for validation by the [SignInButton].
  final GlobalKey<FormState> formKey;

  const LoginFormBody({super.key, required this.formKey});

  @override
  State<LoginFormBody> createState() => _LoginFormBodyState();
}

class _LoginFormBodyState extends State<LoginFormBody> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _sessionCodeController = TextEditingController();
  String? _selectedSessionCode;

  @override
  void initState() {
    super.initState();
    final active = DemoSessionManager.activeSessionId;
    if (active != null && active.isNotEmpty) {
      _selectedSessionCode = active;
      _sessionCodeController.text = active;
    }
    _emailController.addListener(_onEmailChanged);
  }

  void _onEmailChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    _emailController.removeListener(_onEmailChanged);
    _emailController.dispose();
    _passwordController.dispose();
    _sessionCodeController.dispose();
    super.dispose();
  }

  void _openDemoCredentialsDialog() {
    RmsDemoCredentialsDialog.show(
      context,
      currentPortalSpec: DemoConfig.chef,
      initialSessionCode: _selectedSessionCode ?? DemoSessionManager.activeSessionId,
      onAutoFill: (email, password, sessionCode) {
        _selectedSessionCode = sessionCode;
        _sessionCodeController.text = sessionCode;
        _emailController.text = email;
        _passwordController.text = password;
        DemoSessionManager.setSession(sessionCode);
        final bloc = context.read<AuthBloc>();
        bloc.add(LoginEmailChanged(email));
        bloc.add(LoginPasswordChanged(password));
        setState(() {});
      },
      onAutoFillAndSignIn: (email, password, sessionCode) {
        _selectedSessionCode = sessionCode;
        _sessionCodeController.text = sessionCode;
        _emailController.text = email;
        _passwordController.text = password;
        DemoSessionManager.setSession(sessionCode);
        final bloc = context.read<AuthBloc>();
        bloc.add(LoginEmailChanged(email));
        bloc.add(LoginPasswordChanged(password));
        bloc.add(DemoSignInEvent(sessionCode: sessionCode));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDemo = DemoConfig.isDemoEmail(_emailController.text.trim());

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const AuthHeader(
          icon: Icons.grid_view_rounded,
          title: 'Welcome Back',
          subtitle: 'Sign in to access your kitchen dashboard.',
        ),
        const SizedBox(height: 32),
        LoginEmailField(controller: _emailController),
        const SizedBox(height: 20),
        LoginPasswordField(controller: _passwordController),
        if (isDemo) ...[
          const SizedBox(height: 20),
          AuthTextField(
            controller: _sessionCodeController,
            label: 'Demo Session Code',
            hintText: 'Enter session code (e.g. RMS-7K4P)',
            suffixIcon: const Icon(
              Icons.tag_rounded,
              color: NeutralColors.icon,
              size: 20,
            ),
            onChanged: (val) {
              final clean = val.trim().toUpperCase();
              _selectedSessionCode = clean;
              if (clean.isNotEmpty) {
                DemoSessionManager.setSession(clean);
              }
            },
          ),
        ],
        const SizedBox(height: 15),
        SignInButton(
          formKey: widget.formKey,
          sessionCode: _sessionCodeController.text.trim().isNotEmpty
              ? _sessionCodeController.text.trim().toUpperCase()
              : _selectedSessionCode,
        ),
        RmsDemoCredentialsButton(
          onPressed: _openDemoCredentialsDialog,
        ),
      ],
    );
  }
}
