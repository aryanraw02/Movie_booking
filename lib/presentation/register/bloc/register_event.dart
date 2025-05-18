/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-21 11:20:52
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends RegisterEvent {
  final String email;

  const EmailChanged({required this.email});

  @override
  List<Object> get props => [email];

  @override
  String toString() {
    return 'EmailChanged{email: $email}';
  }
}

class PasswordChanged extends RegisterEvent {
  final String password;
  final String confirmPassword;

  const PasswordChanged({
    required this.password,
    required this.confirmPassword,
  });

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'PasswordChanged{password: $password, confirmPassword: $confirmPassword}';
  }
}

class ConfirmPasswordChanged extends RegisterEvent {
  final String password;
  final String confirmPassword;

  const ConfirmPasswordChanged({
    required this.password,
    required this.confirmPassword,
  });

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'ConfirmPasswordChanged{password: $password, confirmPassword: $confirmPassword}';
  }
}

class NameChanged extends RegisterEvent {
  final String name;

  const NameChanged({required this.name});

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'NameChanged{name: $name}';
  }
}

class Submitted extends RegisterEvent {
  final String email;
  final String password;
  final String confirmPassword;
  final String displayName;
  final int age;
  final String gender;

  const Submitted({
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.displayName,
    required this.age,
    required this.gender,
  });

  @override
  List<Object> get props => [
    email,
    password,
    confirmPassword,
    displayName,
    age,
    gender,
  ];

  @override
  String toString() {
    return 'Submitted{email: $email, password: $password, confirmPassword: $confirmPassword, displayName: $displayName, age: $age, gender: $gender}';
  }
}
