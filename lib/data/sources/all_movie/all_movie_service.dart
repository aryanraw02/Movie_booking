/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2025-01-25 08:39:35
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/core/api/rest_client.dart';
import 'package:cinema_booking/data/models/response/all_movie_by_type_response.dart';
import 'package:cinema_booking/service_locator.dart';
import 'package:dartz/dartz.dart';

abstract class AllMoviesService {
  Future<Either> getAllMoviesData();
}

class AllMoviesServiceImpl extends AllMoviesService {
  @override
  Future<Either> getAllMoviesData() async {
    try {
      final client = RestClient(localDio);

      final AllMoviesModelResponse allMoviesData =
          await client.getAllMoviesByType();

      return right(allMoviesData.toEntity());
    } catch (e) {
      return const Left(
        "An error occurred in getAllMoviesData, Please try again ",
      );
    }
  }
}
