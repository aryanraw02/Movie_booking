/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-21 21:28:06
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final HomeEntity homeState;

  const HomeLoaded(this.homeState);

  @override
  List<Object> get props {
    return [homeState];
  }

  @override
  String toString() {
    return 'HomeLoaded{homeState: $homeState}';
  }
}

class HomeNotLoaded extends HomeState {
  final String e;

  const HomeNotLoaded(this.e);

  @override
  String toString() {
    return 'HomeNotLoaded{e: $e}';
  }
}
