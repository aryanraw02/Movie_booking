/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2025-02-21 21:28:06
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

part of 'nearby_cinema_bloc.dart';

class NearbyCineState extends Equatable {
  @override
  List<Object> get props => [];
}

class NearbyCineNotLoaded extends NearbyCineState {}

class NearbyCineLoaded extends NearbyCineState {
  final List<CinemaEntity> cines;

  NearbyCineLoaded({required this.cines});

  @override
  List<Object> get props => [cines];

  @override
  String toString() {
    return 'NearbyCineLoaded{cines: $cines}';
  }
}
