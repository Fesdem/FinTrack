import 'package:financetrack/features/analytics/views/analytics_screen.dart';
import 'package:financetrack/features/auth/views/form_screen.dart';
import 'package:financetrack/features/auth/views/login_screen.dart';
import 'package:financetrack/features/auth/views/signup_screen.dart';
import 'package:financetrack/features/members/views/member_screen.dart';
import 'package:financetrack/features/profile/views/profile_screen.dart';
import 'package:financetrack/features/transaction/views/add_trans_screen.dart';
import 'package:flutter/material.dart';
import 'package:financetrack/features/home/views/home_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(builder: (context) => LoginScreen());
    case SignupScreen.routeName:
      return MaterialPageRoute(builder: (context) => SignupScreen());
    case FormScreen.routeName:
      final argument = settings.arguments as String;
      return MaterialPageRoute(
        builder: (context) => FormScreen(email: argument),
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(builder: (context) => HomeScreen());
    case AnalyticsScreen.routeName:
      return MaterialPageRoute(builder: (context) => AnalyticsScreen());
    case MembersScreen.routeName:
      return MaterialPageRoute(builder: (context) => MembersScreen());
    case ProfileScreen.routeName:
      return MaterialPageRoute(builder: (context) => ProfileScreen());
    case AddTransScreen.routeName:
      return MaterialPageRoute(builder: (context) => AddTransScreen());
    default:
      return MaterialPageRoute(
        builder:
            (context) => const Scaffold(
              body: Center(child: Text('This page does not exist!!')),
            ),
      );
  }
}
