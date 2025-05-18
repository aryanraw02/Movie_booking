/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-25 08:45:56
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

part of 'all_movies_bloc.dart';

class AllMoviesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class OpenScreen extends AllMoviesEvent {}

class ClickIconSearch extends AllMoviesEvent {}

class ClickCloseSearch extends AllMoviesEvent {}

class SearchQueryChanged extends AllMoviesEvent {
  final String keyword;

  SearchQueryChanged({required this.keyword});

  @override
  List<Object> get props => [keyword];

  @override
  String toString() {
    return 'SearchQueryChanged{keyword: $keyword}';
  }
}

class ClickIconSort extends AllMoviesEvent {
  @override
  List<Object> get props => [DateTime.now().millisecond];
}

class SortByChanged extends AllMoviesEvent {
  final MovieSoftBy movieSortBy;

  SortByChanged(this.movieSortBy);

  @override
  List<Object> get props => [movieSortBy];

  @override
  String toString() {
    return 'SortByChanged{movieSortBy: $movieSortBy}';
  }
}
