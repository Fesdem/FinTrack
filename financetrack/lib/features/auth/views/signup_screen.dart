// ignore_for_file: use_build_context_synchronously

import 'package:financetrack/common/constants/colors.dart';
import 'package:financetrack/common/constants/text_styles.dart';
import 'package:financetrack/features/auth/controller/auth_controller.dart';
import 'package:financetrack/features/auth/views/form_screen.dart';
import 'package:financetrack/features/auth/views/login_screen.dart';
import 'package:financetrack/utils/show_snack_bar.dart';
import 'package:financetrack/utils/widgets/header.dart';
import 'package:financetrack/utils/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends ConsumerStatefulWidget {
  static const routeName = '/signup-screen';

  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void _signup() async {
    try {
      if (_passwordController.text.isNotEmpty &&
          _confirmPasswordController.text.isNotEmpty &&
          _emailController.text.isNotEmpty) {
        if (_passwordController.text == _confirmPasswordController.text) {
          showCircleLoader(message: 'Creating Account...');
          String email = _emailController.text;
          String password = _passwordController.text;

          await ref
              .read(authControllerProvider)
              .createAccountWithEmail(
                context: context,
                email: email,
                password: password,
                destination: FormScreen(email: email),
              );
        } else {
          showSnackBar(
            context: context,
            status: Status.error,
            message: 'Paswords must match',
          );
        }
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

  void _navigateToSigninScreen() {
    Navigator.pushReplacementNamed(context, LoginScreen.routeName);
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
              Text('Welcome', style: AppTextStyle.fourtStyle),
              Text('Create an account'),
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
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Text('Confirm Password', style: AppTextStyle.twelStyle),
              TextField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Confirm password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),
              SizedBox(height: 28.h),
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
                  onPressed: _signup,
                  child: Text('Sign Up', style: AppTextStyle.eigStyle),
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account? '),
                  InkWell(
                    onTap: _navigateToSigninScreen,
                    child: Text('Sign In', style: AppTextStyle.elevStyle),
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
