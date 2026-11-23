import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rms_shared_package/rms_shared_package.dart';
import 'package:chef_portal/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:chef_portal/features/auth/presentation/bloc/auth_event.dart';

class AuthHandlers {
  static void handleSignIn(
    BuildContext context,
    GlobalKey<FormState> formKey, {
    String? sessionCode,
  }) {
    if (formKey.currentState?.validate() ?? false) {
      final bloc = context.read<AuthBloc>();
      final form = bloc.currentFormState;
      if (DemoConfig.isDemoEmail(form.email)) {
        bloc.add(DemoSignInEvent(sessionCode: sessionCode));
      } else {
        bloc.add(SignInEvent(form.email, form.password));
      }
    }
  }
}
