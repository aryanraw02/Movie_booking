/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-10-15 10:16:59
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:flutter/material.dart';
import 'package:cinema_booking/common/helpers/is_dark_mode.dart';
import 'package:cinema_booking/core/configs/theme/app_color.dart';
import 'package:go_router/go_router.dart';

///
/// Basic app bar with back button and title
///
class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final Widget action;
  final bool hiveBack;
  final Color backgroundColor;

  const BasicAppBar({
    super.key,
    this.hiveBack = false,
    this.title = const Text(''),
    this.action = const SizedBox(),
    this.backgroundColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      centerTitle: true,
      backgroundColor: backgroundColor,
      elevation: 0,
      actions: [action],
      leading:
          hiveBack
              ? null
              : IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color:
                        context.isDarkMode
                            ? AppColors.white.withValues(alpha: 0.03)
                            : AppColors.darkBackground.withValues(alpha: 0.4),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                    color:
                        context.isDarkMode ? AppColors.white : AppColors.black,
                  ),
                ),
              ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
