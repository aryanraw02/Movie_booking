/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-22 08:47:28
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/common/widgets/image/shimmer_image.dart';
import 'package:cinema_booking/common/widgets/image/svg_image.dart';
import 'package:cinema_booking/common/widgets/scroll_list/hoz_list_view.dart';
import 'package:cinema_booking/common/widgets/space/widget_spacer.dart';
import 'package:cinema_booking/core/configs/theme/app_color.dart';
import 'package:cinema_booking/core/configs/theme/app_font.dart';
import 'package:cinema_booking/core/constants/responsive_breakpoints.dart';
import 'package:cinema_booking/domain/entities/response/home.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WidgetHomePosters extends StatefulWidget {
  final List<ItemPosterVM> items;
  final String label;
  final String iconPath;

  const WidgetHomePosters({
    super.key,
    required this.items,
    required this.label,
    required this.iconPath,
  });

  @override
  State<WidgetHomePosters> createState() => _WidgetHomePostersState();
}

class _WidgetHomePostersState extends State<WidgetHomePosters> {
  String directionNow = "";
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildHeader(),
        screenWidth > kTabletBreakpoint
            ? WidgetSpacer(height: 10)
            : WidgetSpacer(height: 2),
        _buildListPoster(screenWidth),
      ],
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        children: [
          MySvgImage(
            path: widget.iconPath,
            width: 20,
            height: 20,
            color: AppColors.black,
          ),
          WidgetSpacer(width: 6),
          Text(widget.label.toUpperCase(), style: AppFont.medium_white_14),
          Spacer(),
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

  _buildListPoster(double screenWidth) {
    return Stack(
      children: [
        WrapContentHozListView(
          list: widget.items,
          itemBuilder: (context, index) {
            var item = widget.items[index];
            return WidgetItemPoster(item: item);
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
            width:
                screenWidth > kTabletBreakpoint
                    ? 150
                    : 50, // Adjust width as needed
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.black.withValues(
                      alpha: 0.80,
                    ), // Dark fade on the left
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
            width:
                screenWidth > kTabletBreakpoint
                    ? 150
                    : 50, // Adjust width as needed
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    Colors.black.withValues(
                      alpha: 0.80,
                    ), // Dark fade on the right
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

class WidgetItemPoster extends StatelessWidget {
  final ItemPosterVM item;

  const WidgetItemPoster({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        openMovieDetails(item.movie, context);
      },
      child: SizedBox(
        width: screenWidth > kTabletBreakpoint ? 325 : 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: ShimmerImage(
                url: item.photo,
                width: screenWidth > kTabletBreakpoint ? 400 : 180,
                height: screenWidth > kTabletBreakpoint ? 200 : 120,
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
            Text(item.subTitle, style: AppFont.regular_white_10),
          ],
        ),
      ),
    );
  }

  void openMovieDetails(MovieDetailEntity movie, BuildContext context) {
    context.go('/movie', extra: movie);
  }
}

class ItemPosterVM {
  late String title;
  late String subTitle;
  late String photo;
  late MovieDetailEntity movie;

  ItemPosterVM(this.photo, this.title, this.subTitle);

  ItemPosterVM.fromMovie(this.movie) {
    title = movie.detail.name;
    subTitle = movie.detail.tags.join(" - ");
    photo = movie.detail.thumb;
  }
}
