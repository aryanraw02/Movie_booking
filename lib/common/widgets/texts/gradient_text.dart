/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2025-01-24 08:46:47
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/core/configs/theme/app_color.dart';
import 'package:flutter/material.dart';

///
/// Widget to display gradient text
///
class GradientText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;

  const GradientText({super.key, required this.text, required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback:
          (bounds) => LinearGradient(
            colors: AppColors.linearColor,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
      child: Text(text, style: textStyle),
    );
  }
}
