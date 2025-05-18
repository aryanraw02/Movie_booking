/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-21 21:28:06
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/common/widgets/image/shimmer_image.dart';
import 'package:cinema_booking/common/widgets/scroll_list/hoz_list_view.dart';
import 'package:cinema_booking/common/widgets/space/widget_spacer.dart';
import 'package:cinema_booking/core/configs/theme/app_color.dart';
import 'package:cinema_booking/core/configs/theme/app_font.dart';
import 'package:cinema_booking/presentation/home/recommended_movies/bloc/recommended_movies_bloc.dart';
import 'package:cinema_booking/presentation/home/recommended_movies/model/item_recommended.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class WidgetRecommendedMovies extends StatefulWidget {
  const WidgetRecommendedMovies({super.key});

  @override
  State<WidgetRecommendedMovies> createState() =>
      _WidgetRecommendedMoviesState();
}

class _WidgetRecommendedMoviesState extends State<WidgetRecommendedMovies> {
  late List<ItemRecommendedMovieVM> items;

  String directionNow = "";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendedMoviesBloc, RecommendedMoviesState>(
      builder: (context, state) {
        if (state is RecommendedMoviesLoaded) {
          items =
              state.movies
                  .map((movie) => ItemRecommendedMovieVM.fromMovie(movie))
                  .toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[_buildHeader(), _buildListRecommendedMovies()],
          );
        } else {
          return Container();
        }
      },
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'New theatrical movie'.toUpperCase(),
            style: AppFont.medium_white_14,
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "View All",
              style: AppFont.medium_white_12.copyWith(color: AppColors.red),
            ),
          ),
        ],
      ),
    );
  }

  _buildListRecommendedMovies() {
    return Stack(
      children: [
        WrapContentHozListView(
          list: items,
          itemBuilder: (context, index) {
            var item = items[index];
            return _WidgetItemRecommendedSeat(item);
          },
          separatorBuilder: (context, index) {
            return WidgetSpacer(width: 16);
          },
          onScrollDirectionChanged: (direction) {
            if (directionNow != direction) {
              setState(() {
                directionNow = direction;
              });
            }
          },
        ),

        // Left Dim Effect
        if (directionNow == "right")
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            width: 50, // Adjust width as needed
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    AppColors.darkBackground, // Dark fade on the left
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

        // Right Dim Effect
        if (directionNow == "left")
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            width: 50, // Adjust width as needed
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    AppColors.darkBackground, // Dark fade on the right
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _WidgetItemRecommendedSeat extends StatelessWidget {
  final ItemRecommendedMovieVM item;

  const _WidgetItemRecommendedSeat(this.item);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        openMovieDetails(context);
      },
      child: SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: ShimmerImage(
                url: item.photo,
                width: 180,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            WidgetSpacer(height: 4),
            Text(
              item.title,
              style: AppFont.regular_white_12,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            WidgetSpacer(height: 2),
            Row(
              children: <Widget>[
                Icon(Icons.favorite, color: AppColors.red, size: 14),
                WidgetSpacer(width: 6),
                Text('${item.likePercent}%', style: AppFont.regular_white_10),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void openMovieDetails(BuildContext context) {
    context.go('/movie', extra: item.movie);
  }
}
