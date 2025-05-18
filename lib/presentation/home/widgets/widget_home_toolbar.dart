/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-21 21:28:06
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'dart:async';

import 'package:cinema_booking/common/bloc/authentication/authentication_bloc.dart';
import 'package:cinema_booking/common/widgets/space/widget_spacer.dart';
import 'package:cinema_booking/core/configs/assets/app_images.dart';
import 'package:cinema_booking/core/configs/theme/app_color.dart';
import 'package:cinema_booking/core/configs/theme/app_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WidgetHomeToolbar extends StatefulWidget {
  const WidgetHomeToolbar({super.key});

  @override
  State<WidgetHomeToolbar> createState() => _WidgetHomeToolbarState();
}

class _WidgetHomeToolbarState extends State<WidgetHomeToolbar>
    with TickerProviderStateMixin {
  int _textIndex = 0;
  late Timer _timer;
  late AnimationController _avatarController;
  late AnimationController _notificationController;
  late Animation<double> _avatarGlow;
  late Animation<double> _notificationShake;
  final List<Widget> _textWidgets = [];

  @override
  void initState() {
    super.initState();
    _initTextWidgets();
    _setupAnimations();
    _startTextSwitcher();
  }

  void _initTextWidgets() {
    _textWidgets.add(_buildUserInfo());
    _textWidgets.add(_buildAlternateText("Hello Have a nice day"));
    _textWidgets.add(_buildAlternateText("Cinema booking yêu bạn"));
  }

  void _setupAnimations() {
    _avatarController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _avatarGlow = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _avatarController, curve: Curves.easeInOut),
    );

    _notificationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _notificationShake = Tween<double>(begin: 0.0, end: 4.0).animate(
      CurvedAnimation(parent: _notificationController, curve: Curves.elasticIn),
    );
  }

  void _triggerNotificationShake() {
    _notificationController.forward(from: 0.0);
  }

  void _startTextSwitcher() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      setState(() {
        _textIndex = (_textIndex + 1) % _textWidgets.length;
      });
      _triggerNotificationShake();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _avatarController.dispose();
    _notificationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: AppColors.darkBackground,
      height: 70,
      child: Row(
        children: <Widget>[_buildAvatarAndName(), _buildNotificationIcon()],
      ),
    );
  }

  Widget _buildAvatarAndName() {
    return Expanded(
      child: Row(
        children: [
          _buildAnimatedAvatar(),
          WidgetSpacer(width: 24),
          _buildAnimatedText(),
        ],
      ),
    );
  }

  Widget _buildAnimatedAvatar() {
    return ScaleTransition(
      scale: _avatarGlow,
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.6),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
          border: Border.all(color: AppColors.white, width: 1.0),
          image: DecorationImage(image: AssetImage(AppImages.avatar)),
        ),
      ),
    );
  }

  Widget _buildAnimatedText() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, 0.2),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
      },
      child: _textWidgets[_textIndex],
    );
  }

  Widget _buildUserInfo() {
    return Column(
      key: const ValueKey("UserInfo"),
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Chung Nguyen Thanh',
          style: AppFont.medium_white_16.copyWith(fontSize: 15),
        ),
        GestureDetector(
          onTap: () {
            _clickSignOut();
          },
          child: Opacity(
            opacity: 0.5,
            child: Row(
              children: <Widget>[
                Text(
                  'Vietnam',
                  style: AppFont.medium_white_16.copyWith(fontSize: 14),
                ),
                const Icon(Icons.keyboard_arrow_down, color: Colors.white),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAlternateText(String text) {
    return Column(
      key: ValueKey(text),
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(text, style: AppFont.medium_white_16, textAlign: TextAlign.center),
      ],
    );
  }

  Widget _buildNotificationIcon() {
    return AnimatedBuilder(
      animation: _notificationController,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(_notificationShake.value, 0.0),
          child: child,
        );
      },
      child: GestureDetector(
        onTap: () {
          _triggerNotificationShake();
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.defaultColor.withValues(alpha: 0.50),
                blurRadius: 8,
                spreadRadius: 2,
              ),
            ],
          ),
          child: const Icon(
            Icons.notifications,
            color: AppColors.white,
            size: 24,
          ),
        ),
      ),
    );
  }

  void _clickSignOut() {
    BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
  }
}
