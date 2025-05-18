/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2025-01-14 15:42:03
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/data/models/auth/user.dart';

class EditUserReq extends UserModel {
  final String? password;

  EditUserReq({
    required super.email,
    this.password,
    required super.fullName,
    required super.gender,
    required super.age,
  });
}
