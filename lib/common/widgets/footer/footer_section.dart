/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-10-15 20:25:35
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/common/widgets/space/widget_spacer.dart';
import 'package:cinema_booking/core/configs/assets/app_vectors.dart';
import 'package:cinema_booking/core/configs/theme/app_color.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

///
/// Footer section with developer information of Splash screen
///
class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '@2024 Make by ',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.greyLight,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SvgPicture.asset(AppVectors.flutterIcon, height: 17),
                Text(
                  ' Flutter with ',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.greyLight,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Icon(Icons.favorite, size: 17, color: Colors.red),
                Text(
                  ' Love',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.greyLight,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const WidgetSpacer(height: 4),
            RichText(
              text: TextSpan(
                text: 'Developer by ',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.greyLight,
                  fontWeight: FontWeight.w400,
                ),
                children: [
                  TextSpan(
                    text: 'ChunhThanhDe',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.greyLight,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
