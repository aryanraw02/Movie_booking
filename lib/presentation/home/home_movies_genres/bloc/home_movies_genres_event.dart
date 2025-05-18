/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-21 21:28:06
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

part of 'home_movies_genres_bloc.dart';

class HomeMoviesGenresEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class DisplayMoviesByGenres extends HomeMoviesGenresEvent {
  final HomeEntity homeResponse;

  DisplayMoviesByGenres(this.homeResponse);

  @override
  List<Object> get props => [homeResponse];

  @override
  String toString() {
    return 'DisplayMoviesByGenres{homeResponse: $homeResponse}';
  }
}
