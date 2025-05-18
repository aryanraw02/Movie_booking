/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-22 08:30:45
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/domain/entities/response/home.dart';

class AllMoviesEntity {
  List<MovieDetailEntity> nowMovieing;
  List<MovieDetailEntity> comingSoon;
  List<MovieDetailEntity> exclusive;

  AllMoviesEntity({
    required this.nowMovieing,
    required this.comingSoon,
    required this.exclusive,
  });

  @override
  String toString() {
    return 'AllMoviesEntity(nowMovieing: ${nowMovieing.map((movie) => movie.toString()).join(", ")}, '
        'comingSoon: ${comingSoon.map((movie) => movie.toString()).join(", ")}, '
        'exclusive: ${exclusive.map((movie) => movie.toString()).join(", ")})';
  }
}
