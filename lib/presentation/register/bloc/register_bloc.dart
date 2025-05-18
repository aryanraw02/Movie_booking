/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-21 11:20:51
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/common/helpers/is_valid.dart';
import 'package:cinema_booking/data/models/auth/create_user_req.dart';
import 'package:cinema_booking/domain/usecase/user/signup.dart';
import 'package:cinema_booking/service_locator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_event.dart';
part 'register_state.dart';

///
/// Bloc handling user register logic.
///
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  /// Initializes the bloc with an empty state.
  RegisterBloc() : super(RegisterState.empty()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<ConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<NameChanged>(_onNameChanged);
    on<Submitted>(_onFormSubmitted);
  }

  /// Handles changes in email input.
  /// Validates the email format and updates the state.
  void _onEmailChanged(EmailChanged event, Emitter<RegisterState> emit) {
    emit(state.update(isEmailValid: Validators.isValidEmail(event.email)));
  }

  /// Handles changes in password input.
  /// Validates the password strength and checks if it matches the confirmation password.
  void _onPasswordChanged(PasswordChanged event, Emitter<RegisterState> emit) {
    final isPasswordValid = Validators.isValidPassword(event.password);
    final isMatched =
        event.confirmPassword.isEmpty ||
        event.password == event.confirmPassword;

    emit(
      state.update(
        isPasswordValid: isPasswordValid,
        isConfirmPasswordValid: isMatched,
      ),
    );
  }

  /// Handles changes in confirm password input.
  /// Ensures that it matches the original password.
  void _onConfirmPasswordChanged(
    ConfirmPasswordChanged event,
    Emitter<RegisterState> emit,
  ) {
    final isConfirmPasswordValid = Validators.isValidPassword(
      event.confirmPassword,
    );
    final isMatched =
        event.password.isEmpty || event.password == event.confirmPassword;

    emit(
      state.update(isConfirmPasswordValid: isConfirmPasswordValid && isMatched),
    );
  }

  /// Handles changes in name input.
  /// Validates if the name format is correct.
  void _onNameChanged(NameChanged event, Emitter<RegisterState> emit) {
    emit(state.update(isNameValid: Validators.isValidName(event.name)));
  }

  /// Handles form submission.
  /// - Validates all fields.
  /// - If valid, sends a registration request.
  /// - Emits loading, success, or failure states accordingly.
  Future<void> _onFormSubmitted(
    Submitted event,
    Emitter<RegisterState> emit,
  ) async {
    // Validate form inputs
    final isValidEmail = Validators.isValidEmail(event.email);
    final isValidName = Validators.isValidName(event.displayName);
    final isValidPassword = Validators.isValidPassword(event.password);
    final isMatched = event.password == event.confirmPassword;

    print('Registration attempt:');
    print('Email valid: $isValidEmail - ${event.email}');
    print('Name valid: $isValidName - ${event.displayName}');
    print('Password valid: $isValidPassword');
    print('Passwords match: $isMatched');

    final newState = state.update(
      isEmailValid: isValidEmail,
      isNameValid: isValidName,
      isPasswordValid: isValidPassword,
      isConfirmPasswordValid: isMatched,
    );

    emit(newState);

    // If form is valid, proceed with registration
    if (newState.isFormValid) {
      print('Form is valid, proceeding with registration');
      emit(RegisterState.loading());

      var result = await sl<SignupUseCase>().call(
        params: CreateUserReq(
          email: event.email,
          fullName: event.displayName,
          password: event.password,
          age: event.age,
          gender: event.gender,
        ),
      );

      result.fold(
        (l) {
          print('Registration failed: $l');
          emit(RegisterState.failure());
        },
        (r) {
          print('Registration successful');
          emit(RegisterState.success());
        },
      );
    }
  }
}
