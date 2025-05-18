/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-10-15 10:16:59
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:dartz/dartz.dart';
import 'package:cinema_booking/core/usecase/usecase.dart';
import 'package:cinema_booking/data/models/auth/create_user_req.dart';
import 'package:cinema_booking/domain/repository/auth/auth.dart';
import 'package:cinema_booking/service_locator.dart';

class SignupUseCase implements UseCase<Either, CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq? params}) async {
    return sl<AuthRepository>().signup(params!);
  }
}
