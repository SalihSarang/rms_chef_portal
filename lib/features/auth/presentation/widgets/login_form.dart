import 'package:chef_portal/core/utils/validators.dart';
import 'package:chef_portal/features/auth/presentation/widgets/components/auth_glass_container.dart';
import 'package:chef_portal/features/auth/presentation/widgets/components/auth_header.dart';
import 'package:chef_portal/features/auth/presentation/widgets/components/need_help_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/app_colors/neutral_colors.dart';
import 'package:rms_design_system/app_colors/primary_colors.dart';
import 'package:rms_design_system/app_colors/text_colors.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import 'auth_text_field.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});

  final _formKey = GlobalKey<FormState>();

  void _onSignIn(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      final bloc = context.read<AuthBloc>();
      final form = bloc.currentFormState;
      bloc.add(SignInEvent(form.email, form.password));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AuthGlassContainer(
      child: Form(
        key: _formKey,
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            final isVisible = state is FormEditingState
                ? state.isPasswordVisible
                : false;
            final isLoading = state is AuthLoading && !state.isInitialCheck;

            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const AuthHeader(
                  icon: Icons.grid_view_rounded,
                  title: 'Welcome Back',
                  subtitle: 'Sign in to access your management dashboard.',
                ),
                const SizedBox(height: 32),
                AuthTextField(
                  label: 'Email Address',
                  hintText: 'name@company.com',
                  validator: AppValidators.validateEmail,
                  onChanged: (value) {
                    context.read<AuthBloc>().add(LoginEmailChanged(value));
                  },
                ),
                const SizedBox(height: 20),
                AuthTextField(
                  label: 'Password',
                  hintText: 'Enter your password',
                  obscureText: !isVisible,
                  validator: AppValidators.validatePassword,
                  onChanged: (value) {
                    context.read<AuthBloc>().add(LoginPasswordChanged(value));
                  },
                  suffixIcon: IconButton(
                    icon: Icon(
                      isVisible ? Icons.visibility : Icons.visibility_off,
                      color: TextColors.secondary,
                      size: 18,
                    ),
                    onPressed: () {
                      context.read<AuthBloc>().add(
                        LoginPasswordVisibilityChanged(),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 5),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: PrimaryColors.buttonActive,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        decorationColor: PrimaryColors.buttonActive,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                BlocListener<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is AuthError) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(state.message)));
                    }
                  },
                  child: ElevatedButton(
                    onPressed: isLoading ? null : () => _onSignIn(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: PrimaryColors.buttonActive,
                      foregroundColor: NeutralColors.white,
                      disabledBackgroundColor: PrimaryColors.buttonActive
                          .withAlpha(128),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      elevation: 0,
                    ),
                    child: isLoading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: NeutralColors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : const Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 10),
                const NeedHelpSection(),
              ],
            );
          },
        ),
      ),
    );
  }
}
