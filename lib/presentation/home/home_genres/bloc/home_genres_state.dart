/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-21 21:28:06
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

part of 'home_genres_bloc.dart';

class HomeGenresState extends Equatable {
  const HomeGenresState();

  @override
  List<Object> get props => [];
}

class HomeGenresLoaded extends HomeGenresState {
  final List<GenresEntity> genres;

  const HomeGenresLoaded(this.genres);

  @override
  List<Object> get props => [genres];
}

class HomeGenresNotLoaded extends HomeGenresState {}
