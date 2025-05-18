/*
 * @ Authenticationor: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-10-15 10:16:59
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/data/sources/authentication/authentication_service.dart';
import 'package:cinema_booking/domain/repository/authentication/authentication.dart';
import 'package:cinema_booking/service_locator.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  @override
  Future<bool> isSignedIn() async {
    return await sl<AuthenticationService>().isSignedIn();
  }
}
