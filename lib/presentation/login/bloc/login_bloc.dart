/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-17 20:15:13
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/common/helpers/is_valid.dart';
import 'package:cinema_booking/common/helpers/log_helpers.dart';
import 'package:cinema_booking/data/models/auth/signin_user_req.dart';
import 'package:cinema_booking/domain/usecase/user/signin.dart';
import 'package:cinema_booking/domain/usecase/user/login_google.dart';
import 'package:cinema_booking/service_locator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

///
/// Bloc that handles the user login process.
///
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  /// Initializes the bloc with an empty state.
  LoginBloc() : super(LoginState.empty()) {
    on<LoginSubmitEmailPasswordEvent>(_onLoginSubmitEmailPasswordEvent);
    on<LoginEmailChanged>(_onLoginEmailChanged);
    on<LoginPasswordChanged>(_onLoginPasswordChanged);
    on<LoginWithGooglePressed>(_onLoginWithGooglePressed);
  }

  /// Handles the login submission event.
  /// - Emits a loading state.
  /// - Calls the `SigninUseCase` to authenticate the user.
  /// - Emits a success or failure state based on the result.
  Future<void> _onLoginSubmitEmailPasswordEvent(
    LoginSubmitEmailPasswordEvent event,
    Emitter<LoginState> emit,
  ) async {
    LogHelper.debug(tag: "LoginBloc", message: 'Start _onLoginSubmitEmailPasswordEvent');
    try {
      emit(LoginState.loading()); // Emit loading state while processing login.

      // Call authentication use case.
      var isSignedIn = await sl<SigninUseCase>().call(
        params: SigninUserReq(email: event.email, password: event.password),
      );

      // Handle authentication result.
      isSignedIn.fold(
        (l) {
          emit(LoginState.failure());
        },
        (r) {
          emit(LoginState.success());
        },
      );
    } catch (e) {
      LogHelper.error(tag: "LoginBloc", message: 'Error _onLoginSubmitEmailPasswordEvent: $e');
      emit(LoginState.failure()); // Emit failure state in case of an exception.
    }
  }

  /// Handles changes in the email input field.
  /// - Uses a debounce delay of **300ms** to prevent excessive state updates.
  /// - Validates the email format and updates the state.
  Future<void> _onLoginEmailChanged(LoginEmailChanged event, Emitter<LoginState> emit) async {
    await Future.delayed(const Duration(milliseconds: 300)); // Debounce input
    emit(state.update(isEmailValid: Validators.isValidEmail(event.email)));
  }

  /// Handles changes in the password input field.
  /// - Uses a debounce delay of **300ms** for better performance.
  /// - Validates the password format and updates the state.
  Future<void> _onLoginPasswordChanged(LoginPasswordChanged event, Emitter<LoginState> emit) async {
    await Future.delayed(const Duration(milliseconds: 300)); // Debounce input
    emit(state.update(isPasswordValid: Validators.isValidPassword(event.password)));
  }

  /// Handles the Google sign-in button press event.
  /// - Emits a loading state.
  /// - Calls the `LoginWithGoogleUsecase` to authenticate the user with Google.
  /// - Emits a success or failure state based on the result.
  Future<void> _onLoginWithGooglePressed(
    LoginWithGooglePressed event,
    Emitter<LoginState> emit,
  ) async {
    LogHelper.debug(tag: "LoginBloc", message: 'Start Google Sign-In');
    try {
      emit(LoginState.loading());
      var result = await sl<LoginWithGoogleUsecase>().call();
      result.fold(
        (error) {
          LogHelper.error(tag: "LoginBloc", message: 'Google Sign-In failed: $error');
          emit(LoginState.failure());
        },
        (success) {
          LogHelper.debug(tag: "LoginBloc", message: 'Google Sign-In successful: $success');
          emit(LoginState.success());
        },
      );
    } catch (e, stackTrace) {
      LogHelper.error(tag: "LoginBloc", message: 'Error during Google Sign-In: $e\n$stackTrace');
      emit(LoginState.failure());
    }
  }
}
