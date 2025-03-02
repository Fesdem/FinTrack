import 'package:financetrack/common/constants/colors.dart';
import 'package:financetrack/common/constants/text_styles.dart';
import 'package:financetrack/utils/widgets/summary_budget_card.dart';
import 'package:financetrack/utils/widgets/trend_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnalyticsScreen extends StatelessWidget {
  static const routeName = '/analytics-screen';

  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Analytics', style: AppTextStyle.sixStyle),
        actions: [
          Badge(
            backgroundColor: redColor,
            child: Icon(Icons.notifications_none, color: Colors.black),
          ),
          SizedBox(width: 6.w),
          Image.asset(
            'assets/icons/profile_pic.png',
            width: 40.w,
            height: 40.h,
          ),
          SizedBox(width: 10.w),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 4.h),
              summaryCard(),
              SizedBox(height: 16.h),
              // Text('Spending Overview', style: AppTextStyle.secStyle),
              TrendCard(),
            ],
          ),
        ),
      ),
    );
  }
}
