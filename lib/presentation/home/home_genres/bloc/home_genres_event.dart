/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-21 21:28:06
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

part of 'home_genres_bloc.dart';

class HomeGenresEvent extends Equatable {
  const HomeGenresEvent();

  @override
  List<Object> get props => [];
}

class DisplayHomeGenres extends HomeGenresEvent {
  final List<GenresEntity> genres;

  const DisplayHomeGenres(this.genres);

  @override
  List<Object> get props => [genres];

  @override
  String toString() {
    return 'Display HomeGenres{genres: $genres}';
  }
}
