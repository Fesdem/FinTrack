import 'package:financetrack/common/constants/colors.dart';
import 'package:financetrack/features/analytics/views/analytics_screen.dart';
import 'package:financetrack/features/home/views/home_screen.dart';
import 'package:financetrack/features/members/views/member_screen.dart';
import 'package:financetrack/features/profile/views/profile_screen.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _currentIndex == 0 ? blueColor : feintBlueColor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.analytics_outlined,
              color: _currentIndex == 1 ? blueColor : feintBlueColor,
            ),
            label: 'Analytics',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.supervised_user_circle_outlined,
              color: _currentIndex == 2 ? blueColor : feintBlueColor,
            ),
            label: 'Members',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_2_outlined,
              color: _currentIndex == 3 ? blueColor : feintBlueColor,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
    );
  }
}

final pages = [
  const HomeScreen(),
  const AnalyticsScreen(),
  MembersScreen(),
  const ProfileScreen(),
];
