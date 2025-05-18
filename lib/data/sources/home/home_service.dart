/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-25 08:39:35
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/core/api/rest_client.dart';
import 'package:cinema_booking/data/models/response/home_response.dart';
import 'package:cinema_booking/service_locator.dart';
import 'package:dartz/dartz.dart';

abstract class HomeService {
  Future<Either> getHomeData();
}

class HomeServiceImpl extends HomeService {
  @override
  Future<Either> getHomeData() async {
    try {
      final client = RestClient(localDio);
      final HomeModelResponse homeData = await client.getHomeData();

      return right(homeData.toEntity());
    } catch (e) {
      return const Left('An error occurred in getHomeData, Please try again.');
    }
  }
}
