/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-17 23:28:42
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/domain/entities/movies/movies.dart';
import 'package:dartz/dartz.dart';

abstract class MovieInfoRepository {
  Future<Either> getMovieInfoData();
  Future<Either> cacheMovieInfoData(MovieEntity show);
}
