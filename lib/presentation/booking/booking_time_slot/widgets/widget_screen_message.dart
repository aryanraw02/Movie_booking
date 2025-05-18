/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2025-01-22 08:45:56
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/core/configs/theme/app_font.dart';
import 'package:flutter/material.dart';

class WidgetScreenMessage extends StatelessWidget {
  final String msg;

  const WidgetScreenMessage({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Text(msg, style: AppFont.regular_gray4_14),
      ),
    );
  }
}
