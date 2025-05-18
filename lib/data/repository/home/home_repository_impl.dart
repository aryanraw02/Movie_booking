/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-17 23:26:52
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/data/sources/home/home_service.dart';
import 'package:cinema_booking/domain/repository/home/home.dart';
import 'package:cinema_booking/service_locator.dart';
import 'package:dartz/dartz.dart';

class HomeRepositoryImpl extends HomeRepository {
  @override
  Future<Either> getHomeData() async {
    return await sl<HomeService>().getHomeData();
  }
}
