/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-21 21:28:06
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/core/configs/assets/app_vectors.dart';
import 'package:cinema_booking/presentation/home/widgets/widget_home_poster.dart';
import 'package:flutter/material.dart';

class WidgetHomePlays extends StatelessWidget {
  final List<ItemPosterVM> items = [
    ItemPosterVM(
      'images/plays/812d7444e0fb6ea5812bcf742b560154@2x.png',
      'Alex in wonderland',
      'Comedy movie',
    ),
    ItemPosterVM(
      'images/plays/74566f854eae1f75d59cdc0cb3d0cac5@2x.png',
      'Marry poppins puffet movie',
      'Music movie',
    ),
    ItemPosterVM(
      'images/plays/e8dc1b71871655544d883871a9b12da1@2x.png',
      'Patrimandram special dewali',
      'Dibet movie',
    ),
    ItemPosterVM(
      'images/plays/345894e2fcd63efef45e132be5cb99eb@2x.png',
      'Happy Halloween 2K19',
      'Music movie',
    ),
  ];

  WidgetHomePlays({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetHomePosters(
      items: items,
      label: 'Plays',
      iconPath: AppVectors.iconPlay,
    );
  }
}
