/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-25 08:45:56
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/common/helpers/log_helpers.dart';
import 'package:cinema_booking/core/enum/sort_movie.dart';
import 'package:cinema_booking/domain/entities/response/all_mobie_by_type.dart';
import 'package:cinema_booking/domain/entities/response/home.dart';
import 'package:cinema_booking/domain/usecase/all_movie/get_all_movie.dart';
import 'package:cinema_booking/service_locator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'all_movies_event.dart';
part 'all_movies_state.dart';

class AllMoviesBloc extends Bloc<AllMoviesEvent, AllMoviesState> {
  MovieSoftBy movieSortBy = MovieSoftBy.ratting;

  AllMoviesBloc() : super(DisplayListMovies.loading()) {
    on<OpenScreen>(_onOpenScreen);
    on<ClickIconSearch>(_onClickIconSearch);
    on<ClickCloseSearch>(_onClickCloseSearch);
    on<SearchQueryChanged>(_onSearchQueryChanged);
    on<ClickIconSort>(_onClickIconSort);
    on<SortByChanged>(_onSortByChanged);
  }

  Future<void> _onOpenScreen(
    OpenScreen event,
    Emitter<AllMoviesState> emit,
  ) async {
    emit(UpdateToolbarState(movieSearchField: false));
    try {
      var response = await sl<GetAllMoviesDataUseCase>().call();

      response.fold(
        (l) {
          emit(DisplayListMovies.error(l.toString()));
        },
        (data) async {
          if (data is AllMoviesEntity) {
            emit(DisplayListMovies.data(_allMovieFromResponse(data)));
          } else {
            emit(DisplayListMovies.error("Invalid response type"));
          }
        },
      );
    } catch (e) {
      emit(DisplayListMovies.error(e.toString()));
    }
  }

  Future<void> _onClickIconSearch(
    ClickIconSearch event,
    Emitter<AllMoviesState> emit,
  ) async {
    emit(UpdateToolbarState(movieSearchField: true));
  }

  Future<void> _onClickCloseSearch(
    ClickCloseSearch event,
    Emitter<AllMoviesState> emit,
  ) async {
    emit(UpdateToolbarState(movieSearchField: false));
    await _mapSearchQueryChangedToState('', emit);
  }

  Future<void> _onSearchQueryChanged(
    SearchQueryChanged event,
    Emitter<AllMoviesState> emit,
  ) async {
    LogHelper.debug(
      tag: "AllMoviesBloc",
      message: "Search query changed: ${event.keyword}",
    );
    await _debouncedSearchQueryChanged(event.keyword, emit);
  }

  Future<void> _debouncedSearchQueryChanged(
    String keyword,
    Emitter<AllMoviesState> emit,
  ) async {
    await Future.delayed(Duration(milliseconds: 400));
    await _mapSearchQueryChangedToState(keyword, emit);
  }

  Future<void> _mapSearchQueryChangedToState(
    String keyword,
    Emitter<AllMoviesState> emit,
  ) async {
    try {
      var response = await sl<GetAllMoviesDataUseCase>().call();

      response.fold(
        (l) {
          emit(DisplayListMovies.error(l.toString()));
        },
        (data) async {
          if (data is AllMoviesEntity) {
            bool query(MovieDetailEntity movie) =>
                keyword.isEmpty ||
                movie.detail.name.toLowerCase().contains(keyword.toLowerCase());

            data.nowMovieing = data.nowMovieing.where(query).toList();
            data.comingSoon = data.comingSoon.where(query).toList();
            data.exclusive = data.exclusive.where(query).toList();

            final allMovie = _allMovieFromResponse(data);

            LogHelper.debug(
              tag: "AllMoviesBloc",
              message: "AllMoviesEntity success allMovie: $allMovie",
            );

            emit(DisplayListMovies.data(allMovie));
          } else {
            emit(DisplayListMovies.error("Invalid response type"));
          }
        },
      );
    } catch (e) {
      emit(DisplayListMovies.error(e.toString()));
    }
  }

  Future<void> _onClickIconSort(
    ClickIconSort event,
    Emitter<AllMoviesState> emit,
  ) async {
    emit(OpenSortOption(isOpen: true, movieSortBy: movieSortBy));
  }

  Future<void> _onSortByChanged(
    SortByChanged event,
    Emitter<AllMoviesState> emit,
  ) async {
    LogHelper.debug(
      tag: "AllMoviesBloc",
      message: "Sorting by: ${event.movieSortBy}",
    );
    movieSortBy = event.movieSortBy;
    emit(UpdateToolbarState(movieSearchField: false));
    await _mapSearchQueryChangedToState('', emit);
  }

  AllMoviesEntity _allMovieFromResponse(AllMoviesEntity response) {
    int Function(MovieDetailEntity a, MovieDetailEntity b) sortBy;
    if (movieSortBy == MovieSoftBy.name) {
      sortBy =
          (MovieDetailEntity a, MovieDetailEntity b) =>
              a.detail.name.compareTo(b.detail.name);
    } else {
      sortBy =
          (MovieDetailEntity a, MovieDetailEntity b) =>
              b.detail.rate.compareTo(a.detail.rate);
    }

    response.nowMovieing.sort(sortBy);
    response.comingSoon.sort(sortBy);
    response.exclusive.sort(sortBy);

    return AllMoviesEntity(
      nowMovieing: response.nowMovieing,
      comingSoon: response.comingSoon,
      exclusive: response.exclusive,
    );
  }
}
