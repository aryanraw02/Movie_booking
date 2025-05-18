/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-21 21:28:06
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/common/widgets/space/widget_spacer.dart';
import 'package:cinema_booking/core/configs/theme/app_font.dart';
import 'package:cinema_booking/core/constants/responsive_breakpoints.dart';
import 'package:cinema_booking/presentation/home/home_genres/bloc/home_genres_bloc.dart';
import 'package:cinema_booking/presentation/home/home_genres/model/item_genres.dart';
import 'package:cinema_booking/presentation/home/home_genres/widgets/widget_item_genres.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WidgetHomeGenres extends StatefulWidget {
  const WidgetHomeGenres({super.key});

  @override
  State<WidgetHomeGenres> createState() => _WidgetHomeGenresState();
}

class _WidgetHomeGenresState extends State<WidgetHomeGenres> {
  List<ItemGenresVM> items = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeGenresBloc, HomeGenresState>(
      builder: (context, state) {
        if (state is HomeGenresLoaded) {
          items =
              state.genres
                  .map((genres) => ItemGenresVM.fromGenres(genres))
                  .toList();

          return Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Movie Genres'.toUpperCase(),
                  style: AppFont.medium_white_14,
                ),
                WidgetSpacer(height: 14),
                _buildListgenres(),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  _buildListgenres() {
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: screenWidth > kTabletBreakpoint ? 80 : 58,
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            var item = items[index];

            return WidgetItemGenres(item: item);
          },
          separatorBuilder: (context, index) {
            return WidgetSpacer(width: 30);
          },
          physics: BouncingScrollPhysics(),
          itemCount: items.length,
        ),
      ),
    );
  }
}
