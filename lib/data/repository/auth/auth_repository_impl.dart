/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-10-15 10:16:59
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/data/models/auth/create_user_req.dart';
import 'package:cinema_booking/data/models/auth/edit_user_req.dart';
import 'package:cinema_booking/data/models/auth/signin_user_req.dart';
import 'package:cinema_booking/data/sources/auth/auth_service.dart';
import 'package:cinema_booking/domain/entities/auth/user.dart';
import 'package:cinema_booking/domain/repository/auth/auth.dart';
import 'package:cinema_booking/service_locator.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    return await sl<AuthService>().signin(signinUserReq);
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    return await sl<AuthService>().signup(createUserReq);
  }

  @override
  Future<Either> editUserInfo(EditUserReq edit) async {
    return await sl<AuthService>().editUserInfo(edit);
  }

  @override
  Future<Either<String, UserEntity>> getUser() async {
    return await sl<AuthService>().getUser();
  }

  @override
  Future<Either> loginWithGoogle() async {
    return await sl<AuthService>().signInWithGoogle();
  }

  @override
  Future<bool> isSignedIn() async {
    return await sl<AuthService>().isSignedIn();
  }
}
