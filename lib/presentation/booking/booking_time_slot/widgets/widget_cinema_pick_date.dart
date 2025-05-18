/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2025-01-22 08:45:56
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'dart:ui';
import 'package:cinema_booking/common/widgets/space/widget_spacer.dart';
import 'package:cinema_booking/core/configs/theme/app_color.dart';
import 'package:flutter/material.dart';

class CinematicBottomBar extends StatelessWidget {
  final VoidCallback onDateTap;
  final VoidCallback onFormatTap;
  final String dateText;
  final String formatText;

  const CinematicBottomBar({
    super.key,
    required this.onDateTap,
    required this.onFormatTap,
    required this.dateText,
    required this.formatText,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        height: 70,
        // padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.black.withValues(
            alpha: 0.6,
          ), // Semi-transparent background
          borderRadius: BorderRadius.vertical(top: Radius.circular(14)),
          gradient: LinearGradient(
            colors: AppColors.linearColor,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 12,
              spreadRadius: -4,
              offset: Offset(0, -4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(14)),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10,
              sigmaY: 10,
            ), // Frosted glass effect
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildSelectionButton(
                  onTap: onDateTap,
                  icon: Icons.calendar_today,
                  text: dateText,
                ),
                _buildSelectionButton(
                  onTap: onFormatTap,
                  icon: Icons.movie_filter,
                  text: formatText,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSelectionButton({
    required VoidCallback onTap,
    required IconData icon,
    required String text,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white.withValues(alpha: 0.1),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withValues(alpha: 0.2),
              blurRadius: 8,
              spreadRadius: -2,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Icon(icon, color: Colors.white, size: 16),
            WidgetSpacer(width: 6),
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
            WidgetSpacer(width: 6),
            Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 14),
          ],
        ),
      ),
    );
  }
}
