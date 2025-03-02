import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:financetrack/common/constants/colors.dart';
import 'package:financetrack/common/constants/text_styles.dart';
import 'package:financetrack/features/auth/views/login_screen.dart';
import 'package:financetrack/features/home/views/home_screen.dart';
import 'package:financetrack/features/views/main_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final bool _isAuthenticated = false;
  final bool _isUserCleared = false;
  final bool _isAuthorized = false;

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
              ? (_isUserCleared
                  ? (_isAuthorized ? MainPage() : LoginScreen())
                  : HomeScreen())
              : LoginScreen(),
      backgroundColor: whiteColor,
      splashTransition: SplashTransition.fadeTransition,
      splashIconSize: MediaQuery.of(context).size.height,
    );
  }
}
