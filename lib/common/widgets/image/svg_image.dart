/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-22 08:25:08
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

///
///  A widget that displays an SVG image from the provided `path` have different color
///
class MySvgImage extends StatelessWidget {
  final String path;
  final double width;
  final double height;
  final Color color;
  final bool applyColorFilter;

  const MySvgImage({
    super.key,
    required this.path,
    required this.width,
    required this.height,
    this.color = Colors.white,
    this.applyColorFilter = true,
  });

  const MySvgImage.toolbarIcon(
    this.path, {
    super.key,
    this.width = 20,
    this.height = 20,
    this.applyColorFilter = true,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: icon color should be dynamic
    return applyColorFilter
        ? SvgPicture.asset(path, width: width, height: height)
        : SvgPicture.asset(path, width: width, height: height);
  }
}
