/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-10-15 10:16:59
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'dart:async';

import 'package:cinema_booking/common/bloc/authentication/authentication_bloc.dart';
import 'package:cinema_booking/common/widgets/footer/footer_section.dart';
import 'package:flutter/material.dart';
import 'package:cinema_booking/common/helpers/is_dark_mode.dart';
import 'package:cinema_booking/core/configs/assets/app_images.dart';
import 'package:cinema_booking/core/configs/theme/app_color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  double _progress = 0;
  late bool isGoHome;

  @override
  void initState() {
    super.initState();
    redirect();
  }

  Future<void> redirect() async {
    Timer.periodic(const Duration(milliseconds: 200), (timer) {
      if (mounted) {
        setState(() {
          _progress += 0.1;
          if (_progress >= 2 && mounted) {
            timer.cancel();

            if (isGoHome) {
              context.go('/');
            } else {
              context.go('/login');
            }
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    isGoHome = context.read<AuthenticationBloc>().state is Authenticated;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35.0),
        child: Stack(
          children: [
            _loadingBar(),
            _logoWidget(),
            _ourGoal(),
            _bar(),
            FooterSection(),
          ],
        ),
      ),
    );
  }

  Widget _logoWidget() {
    return Align(
      alignment: Alignment(0, -0.6),
      child: Image.asset(AppImages.logo),
    );
  }

  Widget _ourGoal() {
    return Align(
      alignment: Alignment(0, 0.5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 25,
        children: [
          Text(
            'Cinema Booking',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color:
                  context.isDarkMode
                      ? AppColors.white
                      : AppColors.darkBackground,
              fontSize: 32,
            ),
          ),
          Text(
            'Our goal is to simplify the process of finding and booking movie tickets across all cinemas in Hanoi. '
            'We aim to create a seamless and user-friendly platform that enhances the movie-going experience, '
            'connecting users with the best options effortlessly.',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color:
                  context.isDarkMode
                      ? AppColors.greyDark
                      : AppColors.darkBackground,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _loadingBar() {
    return Align(
      alignment: const Alignment(-0.85, -0.82),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.2,
        height: 10,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: MediaQuery.of(context).size.width * 0.1 * _progress,
              height: 10,
              decoration: BoxDecoration(
                color: AppColors.defaultColor,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bar() {
    return Align(
      alignment: Alignment(0, 0.7),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        height: 3,
        decoration: BoxDecoration(
          color: AppColors.greyDark,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
