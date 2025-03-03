import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financetrack/common/animation/splash_screen.dart';
import 'package:financetrack/common/constants/colors.dart';
import 'package:financetrack/features/auth/repository/user_repository.dart';
import 'package:financetrack/firebase_options.dart';
import 'package:financetrack/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  FirebaseFirestore.instance.settings = Settings(persistenceEnabled: true);
  await UserRepository.init();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(385, 840),
      builder: (context, child) {
        return GetMaterialApp(
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
