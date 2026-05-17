import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chef_portal/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:chef_portal/features/auth/presentation/bloc/auth_event.dart';

class AuthHandlers {
  static void handleSignIn(BuildContext context, GlobalKey<FormState> formKey) {
    if (formKey.currentState?.validate() ?? false) {
      final bloc = context.read<AuthBloc>();
      final form = bloc.currentFormState;
      bloc.add(SignInEvent(form.email, form.password));
    }
  }
}
