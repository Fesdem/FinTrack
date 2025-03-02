import 'package:financetrack/common/animation/splash_screen.dart';
import 'package:financetrack/common/constants/colors.dart';
import 'package:financetrack/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(385, 840),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: "Inter",
            scaffoldBackgroundColor: secWhiteColor,
            dialogBackgroundColor: secWhiteColor,
            primaryColor: primaryColor,
            colorScheme: const ColorScheme.light(
              primary: primaryColor,
              secondary: whiteColor,
            ),
          ),
          onGenerateRoute: (settings) => generateRoute(settings),
          home: const SplashScreen(),
        );
      },
    );
  }
}
