import 'package:financetrack/common/constants/colors.dart';
import 'package:financetrack/common/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrendCard extends StatefulWidget {
  const TrendCard({super.key});

  @override
  State<TrendCard> createState() => _TrendCardState();
}

class _TrendCardState extends State<TrendCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Recent Transactions', style: AppTextStyle.secStyle),
        SizedBox(height: 10.h),
        _finTrend(),
        _finTrend(),
        _finTrend(),
        _finTrend(),
        _finTrend(),
        _finTrend(),
        _finTrend(),
      ],
    );
  }
}

Widget _finTrend() {
  return Card(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: blueColor.withOpacity(0.2),
            child: Icon(Icons.shopping_bag_outlined, color: blueColor),
          ),
          SizedBox(width: 8.w),
          Text('Shopping', style: AppTextStyle.ninStyle),
          Spacer(),
          Text('-15%', style: AppTextStyle.thirtStyle),
          SizedBox(width: 10.w),
        ],
      ),
    ),
  );
}
