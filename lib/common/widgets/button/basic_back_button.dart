/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2025-01-13 10:05:19
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/common/widgets/image/svg_image.dart';
import 'package:cinema_booking/core/configs/assets/app_vectors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

///
/// Basic back button
///
class BasicBackButton extends StatelessWidget {
  final EdgeInsets padding;

  const BasicBackButton({
    super.key,
    this.padding = const EdgeInsets.only(left: 12, right: 10),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pop();
      },
      child: Padding(
        padding: padding,
        child: MySvgImage(width: 19, height: 16, path: AppVectors.iconBack),
      ),
    );
  }
}
