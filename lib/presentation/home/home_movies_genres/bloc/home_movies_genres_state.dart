/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-21 21:28:06
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

part of 'home_movies_genres_bloc.dart';

class HomeMoviesGenresState extends Equatable {
  @override
  List<Object> get props => [];
}

class MoviesByGenresNotLoaded extends HomeMoviesGenresState {}

class MoviesByGenresLoaded extends HomeMoviesGenresState {
  final List<MapEntry<GenresEntity, List<MovieDetailEntity>>> list;

  MoviesByGenresLoaded({required this.list});

  @override
  List<Object> get props => [list];
}
