/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2025-01-22 08:45:56
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/common/widgets/image/svg_image.dart';
import 'package:cinema_booking/common/widgets/space/widget_spacer.dart';
import 'package:cinema_booking/core/configs/assets/app_vectors.dart';
import 'package:cinema_booking/core/configs/theme/app_color.dart';
import 'package:cinema_booking/core/configs/theme/app_font.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WidgetToolbar extends StatelessWidget {
  final String title;
  final Widget actions;

  const WidgetToolbar({super.key, required this.title, required this.actions});

  WidgetToolbar.defaultActions({super.key, required this.title})
    : actions = _buildActions();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: AppColors.linearColor,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withValues(alpha: .1),
            blurRadius: 10,
            spreadRadius: -2,
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              context.pop();
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 12, right: 10),
              child: MySvgImage(
                width: 19,
                height: 16,
                path: AppVectors.iconBack,
              ),
            ),
          ),
          Expanded(child: Text(title, style: AppFont.medium_white_16)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
            child: actions,
          ),
        ],
      ),
    );
  }

  static _buildActions() {
    return Row(
      children: <Widget>[
        MySvgImage(path: AppVectors.iconSearch, width: 20, height: 20),
        WidgetSpacer(width: 12),
        MySvgImage(path: AppVectors.iconMore, width: 20, height: 20),
        WidgetSpacer(width: 12),
      ],
    );
  }
}
