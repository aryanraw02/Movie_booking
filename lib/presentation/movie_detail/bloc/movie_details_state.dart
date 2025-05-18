/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-21 21:28:06
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

part of 'movie_details_bloc.dart';

abstract class MovieDetailsState extends Equatable {
  const MovieDetailsState();
}

class InitialMovieDetailsState extends MovieDetailsState {
  @override
  List<Object> get props => [];
}

class OpenBookTimeSlotScreen extends MovieDetailsState {
  final bool open;

  const OpenBookTimeSlotScreen({required this.open});

  @override
  List<Object> get props => [open];
}
