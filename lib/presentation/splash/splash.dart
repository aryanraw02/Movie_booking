/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-10-15 10:16:59
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'dart:async';

import 'package:cinema_booking/common/widgets/footer/footer_section.dart';
import 'package:cinema_booking/core/configs/assets/app_images.dart';
import 'package:cinema_booking/core/configs/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double _progress = 0;

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
            // TODO: need change to Router
            context.go('/get-started');
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _backgroundGradient(),
          _logoWidget(),
          _decorativeLine(),
          _appLogoWidget(),
          _loadingBar(),
          FooterSection(),
        ],
      ),
    );
  }

  Widget _decorativeLine() {
    return Align(
      alignment: const Alignment(-0.8, -0.82),
      child: Container(
        width: 50,
        height: 10,
        decoration: BoxDecoration(
          color: AppColors.defaultColor,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }

  Widget _backgroundGradient() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppColors.splashColor,
        ),
      ),
    );
  }

  Widget _logoWidget() {
    return Align(
      alignment: const Alignment(0, -0.7),
      child: Image.asset(AppImages.logo, fit: BoxFit.cover),
    );
  }

  Widget _appLogoWidget() {
    return Align(
      alignment: const Alignment(0, 0.3),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Image.asset(AppImages.logoCT, fit: BoxFit.cover),
      ),
    );
  }

  Widget _loadingBar() {
    return Align(
      alignment: Alignment(0, 0.6),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        height: 10,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: MediaQuery.of(context).size.width * 0.3 * _progress,
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
}
