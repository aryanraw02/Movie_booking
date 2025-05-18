/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-10-15 10:16:59
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/domain/entities/movies/movies.dart';
import 'package:cinema_booking/domain/repository/movie/movie.dart';
import 'package:dartz/dartz.dart';
import 'package:cinema_booking/service_locator.dart';

///
/// Save movie
///
class CacheMovieInfoDataUseCase {
  Future<Either> call({required MovieEntity movie}) async {
    return await sl<MovieInfoRepository>().cacheMovieInfoData(movie);
  }
}
