/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-10-15 10:16:59
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/data/models/auth/edit_user_req.dart';
import 'package:dartz/dartz.dart';
import 'package:cinema_booking/core/usecase/usecase.dart';

import 'package:cinema_booking/domain/repository/auth/auth.dart';
import 'package:cinema_booking/service_locator.dart';

///
/// update info
///
class EditUserInfoUseCase implements UseCase<Either, EditUserReq> {
  @override
  Future<Either> call({EditUserReq? params}) async {
    return sl<AuthRepository>().editUserInfo(params!);
  }
}
