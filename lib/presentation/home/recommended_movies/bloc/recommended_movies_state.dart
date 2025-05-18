/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-21 21:28:06
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

part of 'recommended_movies_bloc.dart';

class RecommendedMoviesState extends Equatable {
  const RecommendedMoviesState();

  @override
  List<Object> get props => [];
}

class RecommendedMoviesLoaded extends RecommendedMoviesState {
  final List<MovieDetailEntity> movies;

  const RecommendedMoviesLoaded(this.movies);

  @override
  List<Object> get props => movies;

  @override
  String toString() {
    return 'RecommendedMoviesLoaded{movies: $movies}';
  }
}

class RecommendedMoviesNotLoaded extends RecommendedMoviesState {}
