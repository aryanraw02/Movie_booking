/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-21 21:28:06
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/common/widgets/button/basic_back_button.dart';
import 'package:cinema_booking/common/widgets/image/svg_image.dart';
import 'package:cinema_booking/core/configs/assets/app_vectors.dart';
import 'package:flutter/material.dart';

class WidgetMovieTrailer extends StatelessWidget {
  const WidgetMovieTrailer({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 360 / 196,
      child: Stack(
        children: <Widget>[
          Image.asset("assets/images/thumb_movie.png", fit: BoxFit.contain),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 42,
              width: 42,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black38,
              ),
              child: Center(
                child: MySvgImage(
                  width: 16.72,
                  height: 15.07,
                  path: AppVectors.iconPlay,
                ),
              ),
            ),
          ),
          BasicBackButton(padding: const EdgeInsets.only(left: 20, top: 20)),
        ],
      ),
    );
  }
}
