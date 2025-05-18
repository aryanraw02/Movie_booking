/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-21 21:28:06
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/common/widgets/space/widget_spacer.dart';
import 'package:cinema_booking/presentation/home/home_movies_genres/bloc/home_movies_genres_bloc.dart';
import 'package:cinema_booking/presentation/home/home_movies_genres/widgets/widget_home_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WidgetHomeMoviesGenres extends StatefulWidget {
  const WidgetHomeMoviesGenres({super.key});

  @override
  State<WidgetHomeMoviesGenres> createState() => _WidgetHomeMoviesGenresState();
}

class _WidgetHomeMoviesGenresState extends State<WidgetHomeMoviesGenres> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeMoviesGenresBloc, HomeMoviesGenresState>(
      builder: (context, state) {
        if (state is MoviesByGenresLoaded) {
          final list = state.list;

          return ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final mapEntry = list[index];
              final genres = mapEntry.key;
              final movies = mapEntry.value;

              return WidgetHomeEvents(genres: genres, movies: movies);
            },
            separatorBuilder: (context, index) {
              return WidgetSpacer(height: 20);
            },
            itemCount: list.length,
          );
        } else {
          return Container();
        }
      },
    );
  }
}
