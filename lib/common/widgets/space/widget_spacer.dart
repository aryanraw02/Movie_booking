/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-16 21:57:50
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:flutter/material.dart';

///
/// Widget spacer replace for SizedBox
///

class WidgetSpacer extends StatelessWidget {
  final double height;
  final double width;

  const WidgetSpacer({super.key, this.height = 16, this.width = 0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height, width: width);
  }
}
