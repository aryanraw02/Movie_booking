/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-21 21:28:06
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();
}

class OpenScreen extends MovieDetailsEvent {
  @override
  List<Object> get props => [];
}

class ClickBtnBook extends MovieDetailsEvent {
  final MovieEntity movie;

  const ClickBtnBook(this.movie);

  @override
  List<Object> get props => [movie];
}

class OpenedBookTimeSlotScreen extends MovieDetailsEvent {
  @override
  List<Object> get props => [];
}
