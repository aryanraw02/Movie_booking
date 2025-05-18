/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-24 08:46:47
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/core/configs/theme/app_color.dart';
import 'package:cinema_booking/core/configs/theme/app_font.dart';
import 'package:flutter/material.dart';

///
///  Basic app button with gradient background
///
class BasicAppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double height;
  final double textSize;
  final FontWeight weight;
  final bool isEnabled;

  const BasicAppButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.height = 50,
    this.textSize = 26,
    this.weight = FontWeight.bold,
    this.isEnabled = true, // Added to enable/disable button state
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: InkWell(
        onTap: isEnabled ? onPressed : null,
        borderRadius: BorderRadius.circular(30),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient:
                isEnabled
                    ? LinearGradient(
                      colors: AppColors.linearColor,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                    : LinearGradient(
                      colors: [Colors.grey.shade400, Colors.grey.shade600],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
            boxShadow: [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 6,
                offset: Offset(2, 4),
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: AppFont.semibold_white_18.copyWith(
              fontSize: textSize,
              fontWeight: weight,
            ),
          ),
        ),
      ),
    );
  }
}
