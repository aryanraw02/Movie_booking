/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-21 21:28:06
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/core/configs/theme/app_color.dart';
import 'package:cinema_booking/core/configs/theme/app_font.dart';
import 'package:flutter/material.dart';

class AgeSelector extends StatefulWidget {
  final Function(int) onAgeSelected; // Callback function to send selected age

  const AgeSelector({super.key, required this.onAgeSelected});

  @override
  State<AgeSelector> createState() => _AgeSelectorState();
}

class _AgeSelectorState extends State<AgeSelector> {
  final int minAge = 10;
  final int maxAge = 90;
  int selectedAge = 18; // Default start age

  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.2,
      initialPage: selectedAge - minAge,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        // physics: const BouncingScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            selectedAge = minAge + index;
          });

          widget.onAgeSelected(selectedAge); // Notify parent about the new age

          // _pageController.animateToPage(
          //   index,
          //   duration: const Duration(milliseconds: 400),
          //   curve: Curves.easeOutExpo,
          // );
        },
        itemCount: maxAge - minAge + 1,
        itemBuilder: (context, index) {
          int age = minAge + index;
          bool isSelected = age == selectedAge;

          return Center(
            child: Text(
              "$age",
              style: AppFont.medium_white_22.copyWith(
                fontSize: isSelected ? 24 : 18, // Enlarge selected age
                color:
                    isSelected ? AppColors.defaultColor : AppColors.textLight,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          );
        },
      ),
    );
  }
}
