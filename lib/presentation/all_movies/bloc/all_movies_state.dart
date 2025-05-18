/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-25 08:45:56
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

part of 'all_movies_bloc.dart';

class AllMoviesState extends Equatable {
  @override
  List<Object> get props => [];
}

class DisplayListMovies extends AllMoviesState {
  final AllMoviesEntity? meta;
  final bool loading;
  final String? msg;

  DisplayListMovies({
    required this.meta,
    required this.loading,
    required this.msg,
  });

  factory DisplayListMovies.loading() {
    return DisplayListMovies(msg: null, meta: null, loading: true);
  }

  factory DisplayListMovies.data(AllMoviesEntity meta) {
    return DisplayListMovies(msg: null, meta: meta, loading: false);
  }

  factory DisplayListMovies.error(String msg) {
    return DisplayListMovies(msg: msg, meta: null, loading: false);
  }

  @override
  String toString() {
    return 'DisplayListMovies{meta: $meta, loading: $loading, msg: $msg}';
  }
}

class UpdateToolbarState extends AllMoviesState {
  final bool movieSearchField;

  UpdateToolbarState({required this.movieSearchField});

  @override
  List<Object> get props => [movieSearchField];

  @override
  String toString() {
    return 'UpdateSearchIconState{movieSearchIcon: $movieSearchField}';
  }
}

class OpenSortOption extends AllMoviesState {
  final bool isOpen;
  final MovieSoftBy movieSortBy;

  OpenSortOption({required this.isOpen, required this.movieSortBy});

  @override
  List<Object> get props => [isOpen, movieSortBy, DateTime.now().millisecond];

  @override
  String toString() {
    return 'OpenSortOption{isOpen: $isOpen, movieSortBy: $movieSortBy}';
  }
}
