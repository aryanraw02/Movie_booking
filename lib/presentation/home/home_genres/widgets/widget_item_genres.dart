import 'package:cinema_booking/common/widgets/image/svg_image.dart';
import 'package:cinema_booking/common/widgets/space/widget_spacer.dart';
import 'package:cinema_booking/core/configs/theme/app_font.dart';
import 'package:cinema_booking/core/constants/responsive_breakpoints.dart';
import 'package:cinema_booking/presentation/home/home_genres/model/item_genres.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class WidgetItemGenres extends StatelessWidget {
  final ItemGenresVM item;

  const WidgetItemGenres({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth > kTabletBreakpoint
        ? MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              openAllMovies(context);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Tooltip(
                  message: item.title,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                    ),
                    child: SvgPicture.asset(item.image, width: 36, height: 36),
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  item.title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        )
        : GestureDetector(
          onTap: () {
            openAllMovies(context);
          },
          child: Column(
            children: <Widget>[
              SizedBox(
                width: 34,
                height: 34,
                child: Center(
                  child: MySvgImage(
                    path: item.image,
                    width: 28,
                    height: 28,
                    applyColorFilter: false,
                  ),
                ),
              ),
              WidgetSpacer(height: 4),
              Text(
                item.title,
                style: AppFont.regular_gray1_14.copyWith(fontSize: 12),
              ),
            ],
          ),
        );
  }

  void openAllMovies(BuildContext context) {
    context.go('/allMovies');
  }
}
