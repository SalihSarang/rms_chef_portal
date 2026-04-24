import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_design_system/rms_design_system.dart';
import 'package:chef_portal/core/utils/validators.dart';
import 'package:chef_portal/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:chef_portal/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:chef_portal/features/auth/presentation/bloc/auth_event.dart';

/// The internal text field for password entry, handling its own visibility
/// toggle UI and communication with the [AuthBloc].
class LoginPasswordInput extends StatelessWidget {
  final bool isVisible;

  const LoginPasswordInput({super.key, required this.isVisible});

  @override
  Widget build(BuildContext context) {
    return AuthTextField(
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
          context.read<AuthBloc>().add(LoginPasswordVisibilityChanged());
        },
      ),
    );
  }
}
