import 'package:financetrack/common/constants/colors.dart';
import 'package:financetrack/common/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecentTransCard extends StatelessWidget {
  const RecentTransCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Recent Transactions', style: AppTextStyle.secStyle),
            TextButton(
              onPressed: () {},
              child: Text('See All', style: AppTextStyle.elevStyle),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        _finItem(),
        _finItem(),
        _finItem(),
        _finItem(),
        _finItem(),
      ],
    );
  }
}

Widget _finItem() {
  return Card(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: blueColor.withOpacity(0.2),
                child: Icon(Icons.shopping_bag_outlined, color: blueColor),
              ),
              SizedBox(width: 4.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Shopping', style: AppTextStyle.ninStyle),
                  Text('2:30 PM', style: AppTextStyle.tenStyle),
                ],
              ),
              Spacer(),
              Text('-\$200', style: AppTextStyle.thirtStyle),
              SizedBox(width: 6.w),
              Image.asset(
                'assets/icons/profile_pic.png',
                width: 40.w,
                height: 40.h,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert, color: feintBlueColor),
              ),
            ],
          ),
          SizedBox(height: 16.h),
        ],
      ),
    ),
  );
}
