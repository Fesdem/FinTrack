import 'package:financetrack/common/constants/colors.dart';
import 'package:financetrack/common/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget summaryCard() {
  return Container(
    height: 188.h,
    width: double.infinity,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [primaryColor, lightBlueColor],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(10.r),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 19.0.h, vertical: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Total Balance', style: AppTextStyle.fifStyle),
          Text('\$24,562.00', style: AppTextStyle.firStyle),
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text('Income', style: AppTextStyle.fifStyle),
                  Text('\$32,100', style: AppTextStyle.eigStyle),
                ],
              ),
              Column(
                children: [
                  Text('Expenses', style: AppTextStyle.fifStyle),
                  Text('\$7,538', style: AppTextStyle.eigStyle),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
