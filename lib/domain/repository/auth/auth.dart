/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-10-15 10:16:59
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/data/models/auth/edit_user_req.dart';
import 'package:dartz/dartz.dart';
import 'package:cinema_booking/data/models/auth/create_user_req.dart';
import 'package:cinema_booking/data/models/auth/signin_user_req.dart';

abstract class AuthRepository {
  Future<Either> signup(CreateUserReq createUserReq);

  Future<Either> editUserInfo(EditUserReq edit);

  Future<Either> signin(SigninUserReq signinUserReq);

  Future<Either> getUser();

  Future<Either> loginWithGoogle();

  Future<bool> isSignedIn();
}
