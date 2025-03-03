// ignore_for_file: use_build_context_synchronously

import 'package:financetrack/common/constants/colors.dart';
import 'package:financetrack/common/constants/text_styles.dart';
import 'package:financetrack/features/auth/controller/auth_controller.dart';
import 'package:financetrack/features/auth/views/signup_screen.dart';
import 'package:financetrack/features/views/main_page.dart';
import 'package:financetrack/utils/show_snack_bar.dart';
import 'package:financetrack/utils/widgets/header.dart';
import 'package:financetrack/utils/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const routeName = '/login-screen';

  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isSeen = false;

  void _login() async {
    try {
      if (_passwordController.text.isNotEmpty &&
          _emailController.text.isNotEmpty) {
        showCircleLoader(message: 'Logging In...');
        String email = _emailController.text.trim();
        String password = _passwordController.text;

        await ref
            .read(authControllerProvider)
            .logInWithEmail(
              context: context,
              email: email,
              password: password,
              destination: const MainPage(),
            );
      } else {
        showSnackBar(
          context: context,
          status: Status.error,
          message: 'Email and Password fields must be filled!',
        );
      }
    } catch (e) {
      showSnackBar(
        context: context,
        status: Status.error,
        message: 'An error occured. Try again later!',
      );
    } finally {
      // hideLoader();
    }
  }

  void _navigateToSignupScreen() {
    Navigator.pushReplacementNamed(context, SignupScreen.routeName);
  }

  void _toogle() {
    _isSeen = !_isSeen;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8.h),
              header(),
              SizedBox(height: 46.h),
              Text('Welcome Back', style: AppTextStyle.fourtStyle),
              Text('Sign in to continue'),
              SizedBox(height: 27.h),
              Text('Email', style: AppTextStyle.twelStyle),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Text('Password', style: AppTextStyle.twelStyle),
              TextField(
                controller: _passwordController,
                obscureText: !_isSeen,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _toogle();
                      });
                    },
                    icon: Icon(
                      _isSeen
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                  ),
                  hintText: 'Enter your password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot Password?',
                    style: AppTextStyle.elevStyle,
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 56.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  onPressed: _login,
                  child: Text('Sign In', style: AppTextStyle.eigStyle),
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account? '),
                  InkWell(
                    onTap: _navigateToSignupScreen,
                    child: Text('Sign Up', style: AppTextStyle.elevStyle),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
