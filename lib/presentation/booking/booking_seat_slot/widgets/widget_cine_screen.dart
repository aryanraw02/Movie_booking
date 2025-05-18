/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2025-01-22 08:45:56
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/core/configs/theme/app_color.dart';
import 'package:cinema_booking/core/configs/theme/app_font.dart';
import 'package:flutter/material.dart';

class WidgetCineScreen extends StatefulWidget {
  const WidgetCineScreen({super.key});

  @override
  State<WidgetCineScreen> createState() => _WidgetCineScreenState();
}

class _WidgetCineScreenState extends State<WidgetCineScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Stack(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 320 / 41,
            child: CustomPaint(painter: CurveScreenPainter()),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(
              child: Text('Screen here', style: AppFont.regular_gray4_12),
            ),
          ),
        ],
      ),
    );
  }
}

class CurveScreenPainter extends CustomPainter {
  final double strokeWidth = 8.0;
  final double offset = 10.0;

  @override
  void paint(Canvas canvas, Size size) {
    var paint =
        Paint()
          ..shader = LinearGradient(
            colors: AppColors.linearColor,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
          ..style = PaintingStyle.stroke
          ..isAntiAlias = true
          ..strokeCap = StrokeCap.round
          ..strokeWidth = strokeWidth;

    var path = Path();
    path.moveTo(offset, size.height - offset);
    path.quadraticBezierTo(
      size.width / 2,
      -size.height + offset,
      size.width - offset,
      size.height - offset,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.green[800]!;
    paint.style = PaintingStyle.fill;

    var path = Path();
    path.lineTo(size.width, size.height);

    path.moveTo(0, size.height * 0.25);
    path.quadraticBezierTo(
      size.width / 2,
      size.height / 2,
      size.width,
      size.height * 0.25,
    );
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
