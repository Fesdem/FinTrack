import 'package:financetrack/common/constants/colors.dart';
import 'package:financetrack/common/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MembersScreen extends StatelessWidget {
  static const routeName = '/members-screen';

  const MembersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Members', style: AppTextStyle.sixStyle),
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
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text('234', style: AppTextStyle.fourtStyle),
                      Text('Total Members', style: AppTextStyle.tenStyle),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.circle, color: greenColor, size: 10),
                          SizedBox(width: 4.w),
                          Text('45', style: AppTextStyle.fourtStyle),
                        ],
                      ),
                      Text('Active Now', style: AppTextStyle.tenStyle),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.trending_up_outlined,
                            color: greenColor,
                            size: 24,
                          ),
                          Text('12', style: AppTextStyle.fourtStyle),
                        ],
                      ),
                      Text('New This Week', style: AppTextStyle.tenStyle),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                    ),
                    onPressed: () {},
                    child: Text('All Members', style: AppTextStyle.fourStyle),
                  ),
                  SizedBox(width: 10.w),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: ashColor),
                    onPressed: () {},
                    child: Text('Admins', style: AppTextStyle.sevStyle),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              _members(),
              _members(),
              _members(),
              _members(),
              _members(),
              _members(),
              _members(),
              _members(),
              _members(),
              _members(),
              _members(),
              _members(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _members() {
  return Card(
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Row(
        children: [
          Image.asset(
            'assets/icons/profile_pic.png',
            width: 60.w,
            height: 60.h,
          ),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('John Doe', style: AppTextStyle.ninStyle),
              Text('Admin', style: AppTextStyle.tenStyle),
            ],
          ),
          const Spacer(),
          Icon(Icons.more_vert, color: darkBlueColor),
        ],
      ),
    ),
  );
}
