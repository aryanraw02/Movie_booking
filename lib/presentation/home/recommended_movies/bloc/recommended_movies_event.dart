/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-21 21:28:06
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

part of 'recommended_movies_bloc.dart';

class RecommendedMoviesEvent extends Equatable {
  const RecommendedMoviesEvent();

  @override
  List<Object> get props => [];
}

class DisplayRecommendedMovies extends RecommendedMoviesEvent {
  final List<MovieDetailEntity> movies;

  const DisplayRecommendedMovies(this.movies);

  @override
  List<Object> get props => [movies];

  @override
  String toString() {
    return 'DisplayRecommendedMovies{movies: $movies}';
  }
}
