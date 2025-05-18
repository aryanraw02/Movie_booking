/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-17 20:15:13
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginEmailChanged extends LoginEvent {
  final String email;

  const LoginEmailChanged({required this.email});

  @override
  List<Object> get props => [email];

  @override
  String toString() {
    return 'LoginEmailChanged{email: $email}';
  }
}

class LoginPasswordChanged extends LoginEvent {
  final String password;

  const LoginPasswordChanged({required this.password});

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'LoginPasswordChanged{password: $password}';
  }
}

class LoginSubmitEmailPasswordEvent extends LoginEvent {
  final String email;
  final String password;

  const LoginSubmitEmailPasswordEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class LoginWithGooglePressed extends LoginEvent {
  @override
  List<Object> get props => [];
}
