/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-21 21:28:06
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/presentation/movie_detail/model/item_cast.dart';
import 'package:flutter/material.dart';
import 'package:cinema_booking/common/widgets/scroll_list/hoz_list_view.dart';
import 'package:cinema_booking/common/widgets/space/widget_spacer.dart';
import 'package:cinema_booking/core/configs/theme/app_color.dart';
import 'package:cinema_booking/core/configs/theme/app_font.dart';
import 'package:cinema_booking/domain/entities/cast/movie_cast.dart';

class WidgetMovieCasts extends StatelessWidget {
  final List<MovieCastEntity> casts;

  const WidgetMovieCasts({super.key, required this.casts});

  @override
  Widget build(BuildContext context) {
    List<ItemCast> items =
        casts.map((cast) => ItemCast.fromCast(cast)).toList();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black.withValues(alpha: .9),
            Colors.black.withValues(alpha: 0.7),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.6),
            blurRadius: 12,
            spreadRadius: -4,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Section Header
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  'Crews & Casts',
                  style: AppFont.semibold_white_16.copyWith(
                    shadows: [Shadow(color: Colors.black38, blurRadius: 6)],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Handle View All Action
                },
                child: Text(
                  'View all >',
                  style: AppFont.medium_white_12.copyWith(
                    color: AppColors.defaultColor,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
          WidgetSpacer(height: 14),
          WrapContentHozListView(
            separatorBuilder: (context, index) {
              return WidgetSpacer(width: 14);
            },
            itemBuilder: (context, index) {
              var item = items[index];
              return WidgetItemCast(item: item);
            },
            list: items,
          ),
        ],
      ),
    );
  }
}

class WidgetItemCast extends StatelessWidget {
  final ItemCast item;

  const WidgetItemCast({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Cast Image with Glow Effect
        Container(
          width: 85,
          //      height: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withValues(alpha: 0.2),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            clipBehavior: Clip.antiAlias,
            child: AspectRatio(
              aspectRatio: 85 / 117,
              child: Image.network(item.photo, fit: BoxFit.cover),
            ),
          ),
        ),
        WidgetSpacer(height: 5),

        // Cast Name
        Text(
          item.name,
          style: AppFont.regular_white_12,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
