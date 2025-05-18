/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-10-14 15:42:03
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String email;
  final String fullName;
  final String gender;
  final int age;

  const UserEntity({
    required this.email,
    required this.fullName,
    required this.age,
    required this.gender,
  });

  @override
  List<Object> get props => [email, fullName, gender, age];
}
