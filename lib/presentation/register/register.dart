/*
 * @ Author: Chung Nguyen Thanh <chunhthanhde.dev@gmail.com>
 * @ Created: 2024-12-21 21:28:06
 * @ Message: 🎯 Happy coding and Have a nice day! 🌤️
 */

import 'dart:ui';

import 'package:cinema_booking/common/bloc/authentication/authentication_bloc.dart';
import 'package:cinema_booking/common/widgets/button/basic_app_button.dart';
import 'package:cinema_booking/common/widgets/snackbar/custom_snackbar.dart';
import 'package:cinema_booking/common/widgets/space/widget_spacer.dart';
import 'package:cinema_booking/common/widgets/texts/gradient_text.dart';
import 'package:cinema_booking/core/configs/assets/app_images.dart';
import 'package:cinema_booking/core/configs/assets/app_vectors.dart';
import 'package:cinema_booking/core/configs/theme/app_color.dart';
import 'package:cinema_booking/core/configs/theme/app_font.dart';
import 'package:cinema_booking/presentation/register/bloc/register_bloc.dart';
import 'package:cinema_booking/presentation/register/widgets/age_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(),
      child: const SignupPage(),
    );
  }
}

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  String selectedGender = 'Male';
  int selectedAge = 18;

  bool get isPopulated =>
      _email.text.isNotEmpty &&
      _password.text.isNotEmpty &&
      _confirmPassword.text.isNotEmpty &&
      _fullName.text.isNotEmpty;

  bool isRegisterButtonEnabled(RegisterState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  void updateAge(int age) {
    setState(() {
      selectedAge = age;
    });
  }

  @override
  void initState() {
    super.initState();
    _email.addListener(_onEmailChanged);
    _password.addListener(_onPasswordChanged);
    _confirmPassword.addListener(_onConfirmPasswordChanged);
    _fullName.addListener(_onNameChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state.isSubmitting) {
          CustomSnackBar.showLoading(context, msg: "Registering ...");
        }

        if (state.isSuccess) {
          BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
          context.go('/'); // Navigate to home page after successful registration
        }

        if (state.isFailure) {
          CustomSnackBar.failure(context, msg: "Registering Failure");
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.darkBackground,
        appBar: AppBar(
          backgroundColor: AppColors.darkBackground,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => context.pop(),
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: Text("Skip", style: AppFont.medium_white_18),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: SvgPicture.asset(AppVectors.unionTop),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: SvgPicture.asset(AppVectors.unionBottom),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Opacity(
                  opacity: 0.3,
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Image.asset(
                      AppImages.ticket,
                      width: MediaQuery.of(context).size.width * 0.4,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Opacity(
                  opacity: 0.3,
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Image.asset(AppImages.logo),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GradientText(
                          text: "REGISTER ME",
                          textStyle: AppFont.semibold_white_30.copyWith(
                            fontFamily: 'Oswald',
                          ),
                        ),
                        WidgetSpacer(width: 10),
                      ],
                    ),
                    const WidgetSpacer(height: 25),
                    _textField("Email", _email),
                    const WidgetSpacer(height: 20),
                    _textField("Full Name", _fullName),
                    const WidgetSpacer(height: 20),
                    _textField("Password", _password),
                    const WidgetSpacer(height: 20),
                    _textField("Conirm Password", _confirmPassword),
                    const WidgetSpacer(height: 30),
                    _genderSelection(),
                    const WidgetSpacer(height: 20),
                    _ageSelection(),
                    const WidgetSpacer(height: 35),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: BasicAppButton(
                        onPressed: () async {
                          _onFormSubmitted();
                        },
                        title: "Sign up",
                        textSize: 22,
                        weight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          style: AppFont.medium_white_18,
          obscureText: label.toLowerCase().contains('password'),
          decoration: InputDecoration(
            hintText: label,
            hintStyle: AppFont.medium_white_18,
            labelText: label,
            labelStyle: AppFont.medium_white_18,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            contentPadding: EdgeInsets.zero,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.textLight),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.textLight),
            ),
            errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
          ),
        ),
        BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            if (label == 'Email' && !state.isEmailValid) {
              return Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  'Please enter a valid email',
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              );
            } else if (label == 'Password' && !state.isPasswordValid) {
              return Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  'Password must be at least 8 characters with letters and numbers',
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              );
            } else if (label == 'Confirm Password' && !state.isConfirmPasswordValid) {
              return Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  'Passwords do not match',
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              );
            } else if (label == 'Full Name' && !state.isNameValid) {
              return Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  'Please enter a valid name',
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              );
            }
            return SizedBox.shrink();
          },
        ),
      ],
    );
  }

  Widget _genderSelection() {
    return Column(
      children: [
        Row(
          children: [
            RichText(
              text: TextSpan(
                style: AppFont.medium_white_18,
                children: [
                  TextSpan(text: "Gender:    ", style: AppFont.medium_white_22),
                  TextSpan(
                    text: selectedGender,
                    style: AppFont.medium_white_22.copyWith(
                      color:
                          selectedGender == "Male"
                              ? AppColors.blue
                              : AppColors.pink,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const WidgetSpacer(height: 35),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _genderAvatar('Male', AppImages.boyAvatar),
            _genderAvatar('Female', AppImages.girlAvatar),
          ],
        ),
      ],
    );
  }

  Widget _genderAvatar(String gender, String imagePath) {
    return GestureDetector(
      onTap: () => setState(() => selectedGender = gender),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color:
                selectedGender == gender
                    ? AppColors.defaultColor
                    : Colors.white24,
            width: 3,
          ),
        ),
        child: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage(imagePath),
        ),
      ),
    );
  }

  Widget _ageSelection() {
    return Column(
      children: [
        Row(children: [Text("Age:", style: AppFont.medium_white_22)]),
        const WidgetSpacer(height: 15),
        AgeSelector(onAgeSelected: updateAge),
      ],
    );
  }

  void _onEmailChanged() {
    context.read<RegisterBloc>().add(EmailChanged(email: _email.text));
  }

  void _onPasswordChanged() {
    context.read<RegisterBloc>().add(
      PasswordChanged(
        password: _password.text,
        confirmPassword: _confirmPassword.text,
      ),
    );
  }

  void _onConfirmPasswordChanged() {
    context.read<RegisterBloc>().add(
      ConfirmPasswordChanged(
        password: _password.text,
        confirmPassword: _confirmPassword.text,
      ),
    );
  }

  void _onNameChanged() {
    context.read<RegisterBloc>().add(NameChanged(name: _fullName.text));
  }

  void _onFormSubmitted() {
    context.read<RegisterBloc>().add(
      Submitted(
        email: _email.text,
        password: _password.text,
        confirmPassword: _confirmPassword.text,
        displayName: _fullName.text,
        age: selectedAge,
        gender: selectedGender,
      ),
    );
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    _fullName.dispose();
    super.dispose();
  }
}
