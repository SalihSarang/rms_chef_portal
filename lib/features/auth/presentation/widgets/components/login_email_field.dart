import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chef_portal/core/utils/validators.dart';
import 'package:chef_portal/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:chef_portal/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:chef_portal/features/auth/presentation/bloc/auth_event.dart';

/// A specialized text field for entering the user's email during login.
class LoginEmailField extends StatelessWidget {
  const LoginEmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthTextField(
      label: 'Email Address',
      hintText: 'name@company.com',
      validator: AppValidators.validateEmail,
      onChanged: (value) {
        context.read<AuthBloc>().add(LoginEmailChanged(value));
      },
    );
  }
}
