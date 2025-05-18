/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-10-15 10:16:59
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/core/usecase/usecase.dart';
import 'package:cinema_booking/domain/repository/home/home.dart';
import 'package:cinema_booking/service_locator.dart';
import 'package:dartz/dartz.dart';

///
/// Get All Data for the Main home screen
///
class GetHomeDataUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<HomeRepository>().getHomeData();
  }
}
