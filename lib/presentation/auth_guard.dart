import 'package:cinema_booking/common/bloc/authentication/authentication_bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cinema_booking/presentation/login/login.dart';

class AuthGuard extends StatelessWidget {
  final Widget child;

  const AuthGuard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is Uninitialized) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is Unauthenticated) {
          return const LoginScreen();
        } else if (state is Authenticated) {
          return child;
        }

        return const Center(child: Text('Unhandled Authentication State'));
      },
    );
  }
}
