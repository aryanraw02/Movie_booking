/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2025-02-21 21:28:06
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

part of 'nearby_cinema_bloc.dart';

class NearbyCineEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class DisplayNearbyCine extends NearbyCineEvent {
  final List<CinemaEntity> cines;

  DisplayNearbyCine({required this.cines});

  @override
  List<Object> get props => [cines];
}
