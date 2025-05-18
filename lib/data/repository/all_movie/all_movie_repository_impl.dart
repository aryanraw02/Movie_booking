/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-17 23:26:52
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/data/sources/all_movie/all_movie_service.dart';
import 'package:cinema_booking/domain/repository/all_movie/all_movie.dart';
import 'package:cinema_booking/service_locator.dart';
import 'package:dartz/dartz.dart';

class AllMoviesRepositoryImpl extends AllMoviesRepository {
  @override
  Future<Either> getAllMoviesData() async {
    return await sl<AllMoviesService>().getAllMoviesData();
  }
}
