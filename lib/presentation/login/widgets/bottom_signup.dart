/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-10-16 21:55:21
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/core/configs/theme/app_font.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WidgetBottomSignUp extends StatelessWidget {
  const WidgetBottomSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Don\'t have an account ?  ', style: AppFont.medium_white_18),
          Flexible(
            child: GestureDetector(
              onTap: () {
                context.go('/register');
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  'Sign up',
                  style: AppFont.semibold_white_18.copyWith(
                    decoration: TextDecoration.underline,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ),
          Flexible(child: Text('here.', style: AppFont.semibold_white_18)),
        ],
      ),
    );
  }
}
