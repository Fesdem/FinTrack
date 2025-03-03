import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:financetrack/common/constants/colors.dart';
import 'package:financetrack/common/constants/text_styles.dart';
import 'package:financetrack/features/auth/repository/user_repository.dart';
import 'package:financetrack/features/auth/views/form_screen.dart';
import 'package:financetrack/features/auth/views/login_screen.dart';
import 'package:financetrack/features/views/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isAuthenticated = false;
  bool _isAuthorized = false;

  @override
  void initState() {
    super.initState();
    _isAuthenticated = UserRepository.getBool('isLoggedIn') ?? false;
    _isAuthorized = UserRepository.getBool('IsAuthorized') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnimatedSplashScreen(
      duration: 3000,
      splash: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 250 / 800 * size.height),
          Image.asset('assets/images/app_logo.png', height: 200, width: 200),
          Text('FinTrack', style: AppTextStyle.sixtStyle),
          Text('Smart Money Management', style: AppTextStyle.secStyle),
          const Spacer(),
          Text(
            '© 2024 FinTrack. All rights reserved.',
            style: AppTextStyle.tenStyle,
          ),
        ],
      ),
      nextScreen:
          _isAuthenticated
              ? (_isAuthorized
                  ? MainPage()
                  : FormScreen(
                    email: FirebaseAuth.instance.currentUser!.email!,
                  ))
              : LoginScreen(),
      backgroundColor: whiteColor,
      splashTransition: SplashTransition.fadeTransition,
      splashIconSize: MediaQuery.of(context).size.height,
    );
  }
}
