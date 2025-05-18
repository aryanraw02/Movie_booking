/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-21 21:28:06
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinema_booking/common/widgets/image/shimmer_image.dart';
import 'package:cinema_booking/common/widgets/space/widget_spacer.dart';
import 'package:cinema_booking/core/configs/theme/app_color.dart';
import 'package:cinema_booking/core/constants/responsive_breakpoints.dart';
import 'package:cinema_booking/presentation/home/home_banner/bloc/home_banner_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WidgetHomeBanner extends StatefulWidget {
  const WidgetHomeBanner({super.key});

  @override
  State<WidgetHomeBanner> createState() => _WidgetHomeBannerState();
}

class _WidgetHomeBannerState extends State<WidgetHomeBanner> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<HomeBannerBloc, HomeBannerState>(
      builder: (context, state) {
        if (state is HomeBannerLoaded) {
          return Column(
            children: [
              _buildCarouselSlider(state, screenWidth),
              WidgetSpacer(height: 10),
              _buildIndicators(state),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }

  Widget _buildCarouselSlider(HomeBannerLoaded state, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: CarouselSlider.builder(
        itemCount: state.banners.length,
        itemBuilder: (context, index, realIndex) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              children: [
                ShimmerImage(
                  url: state.banners[index].url,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: screenWidth > kTabletBreakpoint ? 250 : 180,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        AppColors.darkBackground.withValues(alpha: 0.20),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        options: CarouselOptions(
          height: screenWidth > kTabletBreakpoint ? 250 : 180,
          viewportFraction: 0.85,
          enlargeCenterPage: true,
          enableInfiniteScroll: true,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastLinearToSlowEaseIn,
          onPageChanged: (index, reason) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }

  Widget _buildIndicators(HomeBannerLoaded state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(state.banners.length, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: currentIndex == index ? 18 : 8,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color:
                currentIndex == index
                    ? AppColors.white
                    : AppColors.white.withValues(alpha: 0.30),
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}
