/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-17 21:03:09
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/common/helpers/log_helpers.dart';
import 'package:cinema_booking/core/local/db_helper.dart';
import 'package:cinema_booking/domain/usecase/user/get_user.dart';
import 'package:cinema_booking/domain/usecase/authentication/is_signed_in.dart';
import 'package:cinema_booking/service_locator.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

part "authentication_event.dart";
part "authentication_state.dart";

//
// bloc to check if user is authenticated or not
//
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  AuthenticationBloc() : super(Uninitialized()) {
    on<AppStarted>(_mapAppStartedToState);
    on<LoggedIn>(_mapLoggedInToState);
    on<LoggedOut>(_mapLoggedOutToState);
  }

  AuthenticationState get initialState => Uninitialized();

  /// Handles the `AppStarted` event, checking if the user is signed in.
  Future<void> _mapAppStartedToState(
    AppStarted event,
    Emitter<AuthenticationState> emit,
  ) async {
    try {
      bool isSignedIn = await sl<IsSignedInUsecase>().call();

      // Initialize the local database SQL.
      await DbHelper.init();

      // for splash screen loading
      // await Future.delayed(Duration(seconds: 2));

      LogHelper.debug(
        tag: "AuthenticationBloc",
        message: "isSignedIn : $isSignedIn",
      );

      if (isSignedIn) {
        // Emit the `Authenticated` state with the user's name
        final name = await sl<GetUserUseCase>().call();
        emit(Authenticated(name.toString()));
      } else {
        emit(Unauthenticated());
      }
    } catch (_) {
      emit(Unauthenticated());
    }
  }

  /// Handles the `LoggedIn` event, fetching and setting the authenticated user state.
  Future<void> _mapLoggedInToState(
    LoggedIn event,
    Emitter<AuthenticationState> emit,
  ) async {
    final user = await sl<GetUserUseCase>().call();
    emit(Authenticated(user.toString()));
  }

  /// Handles the `LoggedOut` event, signing out from Firebase and Google.
  Future<void> _mapLoggedOutToState(
    LoggedOut event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(Unauthenticated());
    // Sign out from both FirebaseAuth and GoogleSignIn asynchronously.
    Future.wait([_firebaseAuth.signOut(), _googleSignIn.signOut()]);
  }
}
