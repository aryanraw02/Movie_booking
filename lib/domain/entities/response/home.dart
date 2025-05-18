/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-21 21:31:49
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/domain/entities/cast/movie_cast.dart';
import 'package:cinema_booking/domain/entities/cinema/cinema.dart';
import 'package:cinema_booking/domain/entities/genres/genres.dart';
import 'package:cinema_booking/domain/entities/movies/banner.dart';
import 'package:cinema_booking/domain/entities/movies/movies.dart';
import 'package:cinema_booking/domain/entities/offer/movie_offer.dart';
import 'package:cinema_booking/domain/entities/reviews/movie_review.dart';

part 'movie_by_genres.dart';
part 'movie_detail.dart';

class HomeEntity {
  final List<BannerEntity> banners;
  final List<GenresEntity> genres;
  final List<MovieDetailEntity> recommendedMovies;
  final List<CinemaEntity> nearbyCinemas;
  final List<MovieByGenresEntity> movieByGenres;

  HomeEntity({
    required this.banners,
    required this.genres,
    required this.recommendedMovies,
    required this.nearbyCinemas,
    required this.movieByGenres,
  });
}
