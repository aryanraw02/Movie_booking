/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-17 23:26:52
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/data/sources/movie/movie_info_service.dart';
import 'package:cinema_booking/domain/entities/movies/movies.dart';
import 'package:cinema_booking/domain/repository/movie/movie.dart';
import 'package:cinema_booking/service_locator.dart';
import 'package:dartz/dartz.dart';

class MovieInfoRepositoryImpl extends MovieInfoRepository {
  @override
  Future<Either> cacheMovieInfoData(MovieEntity show) async {
    return await sl<MovieInfoService>().cacheMovie(show);
  }

  @override
  Future<Either> getMovieInfoData() {
    // TODO: implement getMovieInfoData from SQL Lite
    throw UnimplementedError();
  }
}
