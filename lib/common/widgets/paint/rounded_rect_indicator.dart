/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2025-01-24 08:46:47
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:flutter/material.dart';

///
/// Rounded rect indicator decoration in the bottom of the widget
///
class RoundedRectIndicator extends Decoration {
  final BoxPainter _painter;

  RoundedRectIndicator({
    required Color color,
    required double radius,
    double padding = 0.0,
    double weight = 3.0,
  }) : _painter = _RectPainter(color, radius, padding, weight);

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _painter;
  }
}

class _RectPainter extends BoxPainter {
  final Paint _paint;
  final double radius;
  final double padding;
  final double weight;
  final indicatorPaddingBottom = 4.0;

  _RectPainter(Color color, this.radius, this.padding, this.weight)
    : _paint =
          Paint()
            ..color = color
            ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    var width = cfg.size!.width;
    var height = cfg.size!.height;

    var left = 0.0;
    var top = height - indicatorPaddingBottom;
    var right = width;
    var bottom = height - weight - indicatorPaddingBottom;

    //calculate offset
    left = left + offset.dx + padding;
    right = right + offset.dx - padding;

    var rect = RRect.fromLTRBAndCorners(
      left,
      top,
      right,
      bottom,
      topLeft: Radius.circular(radius),
      bottomLeft: Radius.circular(radius),
      bottomRight: Radius.circular(radius),
      topRight: Radius.circular(radius),
    );
    canvas.drawRRect(rect, _paint);
  }
}
