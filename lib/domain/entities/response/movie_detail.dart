/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-22 09:28:55
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

part of 'home.dart';

class MovieDetailEntity {
  final MovieEntity detail;
  final List<String> format;
  final List<String> genres;
  final List<MovieOfferEntity> movieOffer;
  final int totalReviews;
  final MovieReviewEntity latestReviews;
  final List<MovieCastEntity> casts;

  MovieDetailEntity({
    required this.detail,
    required this.format,
    required this.genres,
    required this.movieOffer,
    required this.totalReviews,
    required this.latestReviews,
    required this.casts,
  });
}
