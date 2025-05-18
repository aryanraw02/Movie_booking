/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2025-12-23 12:22:22
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'package:cinema_booking/common/widgets/snackbar/custom_snackbar.dart';
import 'package:cinema_booking/core/configs/assets/app_vectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cinema_booking/common/widgets/space/widget_spacer.dart';
import 'package:cinema_booking/core/configs/theme/app_color.dart';
import 'package:cinema_booking/core/configs/theme/app_font.dart';
import 'package:cinema_booking/common/bloc/authentication/authentication_bloc.dart';
import 'package:cinema_booking/presentation/login/bloc/login_bloc.dart';
import 'package:go_router/go_router.dart';

class WidgetSignInForm extends StatefulWidget {
  const WidgetSignInForm({super.key});

  @override
  State<WidgetSignInForm> createState() => _WidgetSignInFormState();
}

class _WidgetSignInFormState extends State<WidgetSignInForm> {
  late AuthenticationBloc _authenticationBloc;
  late LoginBloc _loginBloc;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool get isPopulated => _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  @override
  void initState() {
    _authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.isSuccess) {
          _authenticationBloc.add(LoggedIn());
          context.go('/');
        }

        if (state.isFailure) {
          CustomSnackBar.failure(context, msg: "Login Failed!");
        }

        if (state.isSubmitting) {
          CustomSnackBar.showLoading(context, msg: "Processing...");
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [Colors.black87, Colors.black54],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.5),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    WidgetSpacer(height: 14),
                    _buildTextDash("Form"),
                    WidgetSpacer(height: 20),
                    _buildTextField("Email", _emailController, Icons.email, isPassword: false),
                    WidgetSpacer(height: 14),
                    _buildTextField("Password", _passwordController, Icons.lock, isPassword: true),
                    WidgetSpacer(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forgot password?",
                        style: AppFont.regular_gray1_14.copyWith(color: Colors.orangeAccent),
                      ),
                    ),
                    WidgetSpacer(height: 30),
                    _buildButtonLogin(state),
                    WidgetSpacer(height: 20),
                    _buildTextDash("Or"),
                    WidgetSpacer(height: 20),
                    _buildSocialLogin(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTextField(
    String hint,
    TextEditingController controller,
    IconData icon, {
    bool isPassword = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12), // Rounded corners for smooth UI
        border: Border.all(
          color: AppColors.white.withValues(alpha: 0.3),
          width: 1,
        ), // Subtle border for elegance
        gradient: LinearGradient(
          colors: [Color(0xFF1E1E1E), Color(0xFF3A3A3A)], // Dark gradient for a cinematic look
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 8,
            spreadRadius: 2,
            offset: Offset(2, 4), // Soft shadow effect
          ),
        ],
      ),
      child: TextFormField(
        onChanged: (value) {
          if (!isPassword) {
            _loginBloc.add(LoginEmailChanged(email: value));
          } else {
            _loginBloc.add(LoginPasswordChanged(password: value));
          }
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (_) {
          return isPassword
              ? !_loginBloc.state.isPasswordValid
                  ? 'Invalid Password'
                  : null
              : !_loginBloc.state.isEmailValid
              ? 'Invalid Email'
              : null;
        },
        maxLines: 1,
        keyboardType: TextInputType.text,
        textAlign: TextAlign.left,
        controller: controller,
        obscureText: isPassword,
        style: AppFont.medium_white_18,
        textAlignVertical: TextAlignVertical.center, // Centers text inside field
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: AppFont.medium_white_18.copyWith(fontSize: 15),
          labelStyle: AppFont.regular_gray1_14.copyWith(fontSize: 16),
          floatingLabelBehavior: FloatingLabelBehavior.auto, // Always show label
          alignLabelWithHint: true, // Aligns label correctly
          contentPadding: const EdgeInsets.symmetric(vertical: 15), // Centers hint
          border: InputBorder.none,
          prefixIcon: Icon(icon, color: AppColors.defaultColor),
        ),
      ),
    );
  }

  Widget _buildButtonLogin(LoginState state) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: () {
          if (isRegisterButtonEnabled()) {
            _loginBloc.add(
              LoginSubmitEmailPasswordEvent(
                email: _emailController.text,
                password: _passwordController.text,
              ),
            );
          } else {
            CustomSnackBar.failure(context, msg: "Invalid Form");
          }
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
              colors: AppColors.linearColor,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          alignment: Alignment.center,
          child: Text("LOGIN", style: AppFont.semibold_white_18.copyWith(fontSize: 18)),
        ),
      ),
    );
  }

  Widget _buildTextDash(String text) {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.white24, thickness: 1)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Container(
            color: Colors.transparent,
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: Text(text, style: AppFont.regular_gray1_14.copyWith(fontSize: 14)),
          ),
        ),
        Expanded(child: Divider(color: Colors.white24, thickness: 1)),
      ],
    );
  }

  bool isRegisterButtonEnabled() {
    return _loginBloc.state.isFormValid && isPopulated && !_loginBloc.state.isSubmitting;
  }

  Widget _buildSocialLogin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: SvgPicture.asset(AppVectors.iconGoogle, height: 30),
          onPressed: () {
            _loginBloc.add(LoginWithGooglePressed());
          },
        ),
        SizedBox(width: 20),
        IconButton(icon: SvgPicture.asset(AppVectors.iconFacebook, height: 30), onPressed: () {}),
      ],
    );
  }
}
