/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-17 21:03:09
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class Uninitialized extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  final String displayName;

  const Authenticated(this.displayName);

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return 'Authenticated{displayName: $displayName}';
  }
}

class Unauthenticated extends AuthenticationState {}
