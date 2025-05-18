/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-10-16 22:05:14
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

// ignore_for_file: non_constant_identifier_names
import 'package:cinema_booking/core/configs/theme/app_color.dart';
import 'package:flutter/material.dart';

///
/// `AppFont` class defines reusable text styles for consistent typography across the app.
///
class AppFont {
  static final regular = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );

  static final medium = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    color: AppColors.black,
  );

  static final semibold = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );

  static final regular_default = regular.copyWith(
    color: AppColors.defaultColor,
  );
  static final regular_default_10 = regular_default.copyWith(fontSize: 10);
  static final regular_default_12 = regular_default.copyWith(fontSize: 12);

  static final regular_white = regular.copyWith(color: AppColors.white);
  static final regular_white_8 = regular_white.copyWith(fontSize: 8);
  static final regular_white_10 = regular_white.copyWith(fontSize: 10);
  static final regular_white_12 = regular_white.copyWith(fontSize: 12);
  static final regular_white_14 = regular_white.copyWith(fontSize: 14);

  static final regular_gray1 = regular.copyWith(color: AppColors.greyLight);
  static final regular_gray1_10 = regular_gray1.copyWith(fontSize: 10);
  static final regular_gray1_12 = regular_gray1.copyWith(fontSize: 12);
  static final regular_gray1_14 = regular_gray1.copyWith(
    fontSize: 14,
    height: 1.5,
  );

  static final regular_gray1_50 = regular.copyWith(
    color: AppColors.greyLight.withAlpha(50),
  );
  static final regular_gray1_50_9 = regular_gray1_50.copyWith(fontSize: 9);
  static final regular_gray1_50_12 = regular_gray1_50.copyWith(fontSize: 12);

  static final regular_black2 = regular.copyWith(color: AppColors.black2);
  static final regular_black2_10 = regular_black2.copyWith(fontSize: 10);
  static final regular_black2_12 = regular_black2.copyWith(fontSize: 12);
  static final regular_black2_14 = regular_black2.copyWith(fontSize: 14);

  static final regular_gray4 = regular.copyWith(color: AppColors.gray4);
  static final regular_gray4_8 = regular_gray4.copyWith(fontSize: 8);
  static final regular_gray4_10 = regular_gray4.copyWith(fontSize: 10);
  static final regular_gray4_12 = regular_gray4.copyWith(fontSize: 12);
  static final regular_gray4_14 = regular_gray4.copyWith(fontSize: 14);

  static final regular_gray4_40 = regular.copyWith(
    color: AppColors.gray4.withAlpha(40),
  );
  static final regular_gray4_40_12 = regular_gray4_40.copyWith(fontSize: 12);

  static final regular_gray5 = regular.copyWith(color: AppColors.gray5);
  static final regular_gray5_10 = regular_gray5.copyWith(fontSize: 10);

  static final regular_gray6 = regular.copyWith(color: AppColors.gray6);
  static final regular_gray6_10 = regular_gray6.copyWith(fontSize: 10);
  static final regular_gray6_12 = regular_gray6.copyWith(fontSize: 12);

  static final regular_blue = regular.copyWith(color: AppColors.blue);
  static final regular_blue_14 = regular_blue.copyWith(fontSize: 14);
  static final regular_blue_16 = regular_blue.copyWith(fontSize: 16);

  // medium
  static final medium_white = medium.copyWith(color: AppColors.white);
  static final medium_white_12 = medium_white.copyWith(fontSize: 12);
  static final medium_white_14 = medium_white.copyWith(fontSize: 14);
  static final medium_white_16 = medium_white.copyWith(fontSize: 16);
  static final medium_white_18 = medium_white.copyWith(fontSize: 18);
  static final medium_white_22 = medium_white.copyWith(fontSize: 22);

  static final medium_default = medium.copyWith(color: AppColors.defaultColor);
  static final medium_default_10 = medium_default.copyWith(fontSize: 10);
  static final medium_default_12 = medium_default.copyWith(fontSize: 12);
  static final medium_default_14 = medium_default.copyWith(fontSize: 14);
  static final medium_default_16 = medium_default.copyWith(fontSize: 16);

  static final medium_white_70 = medium.copyWith(
    color: AppColors.white.withAlpha(70),
  );
  static final medium_white_70_14 = medium_white_70.copyWith(fontSize: 14);

  static final medium_gray4 = medium.copyWith(color: AppColors.gray4);
  static final medium_gray4_10 = medium_gray4.copyWith(fontSize: 10);

  static final medium_black2 = medium.copyWith(color: AppColors.black2);
  static final medium_black2_14 = medium_black2.copyWith(fontSize: 14);
  static final medium_black2_16 = medium_black2.copyWith(fontSize: 16);
  static final medium_black2_18 = medium_black2.copyWith(fontSize: 18);

  static final medium_blue = medium.copyWith(color: AppColors.blue);
  static final medium_blue_14 = medium_blue.copyWith(fontSize: 14);
  static final medium_blue_16 = medium_blue.copyWith(fontSize: 16);

  // semibold
  static final semibold_white = semibold.copyWith(color: AppColors.white);
  static final semibold_white_10 = semibold_white.copyWith(fontSize: 10);
  static final semibold_white_16 = semibold_white.copyWith(fontSize: 16);
  static final semibold_white_18 = semibold_white.copyWith(fontSize: 18);
  static final semibold_white_30 = semibold_white.copyWith(fontSize: 30);

  // oswald
  static final oswald_regular = TextStyle(
    fontFamily: 'Oswald',
    fontWeight: FontWeight.w400,
  );

  static final oswald_regular_red2 = oswald_regular.copyWith(
    color: AppColors.red2,
  );
  static final oswald_regular_red2_12 = oswald_regular_red2.copyWith(
    fontSize: 12,
  );
}
