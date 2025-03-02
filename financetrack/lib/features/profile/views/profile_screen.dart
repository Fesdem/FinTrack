import 'package:financetrack/common/constants/colors.dart';
import 'package:financetrack/common/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile-screen';

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings', style: AppTextStyle.sixStyle),
        actions: [
          Badge(
            backgroundColor: redColor,
            child: Icon(Icons.notifications_none, color: Colors.black),
          ),
          SizedBox(width: 16.w),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          Image.asset('assets/icons/profile_pic.png').image,
                    ),
                    SizedBox(height: 8.h),
                    Text('John Doe', style: AppTextStyle.fourtStyle),
                    Text(
                      'alex.mitchell@email.com',
                      style: AppTextStyle.tenStyle,
                    ),
                    SizedBox(height: 16.h),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ashColor,
                      ),
                      onPressed: () {},
                      child: Text(
                        'Edit Profile',
                        style: AppTextStyle.elevStyle,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4.0.w,
                          vertical: 8.h,
                        ),
                        child: Column(
                          children: [
                            Text('Total Balance', style: AppTextStyle.fifStyle),
                            Text('\$24,562.00', style: AppTextStyle.eigStyle),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4.0.w,
                          vertical: 8.h,
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Monthly Income',
                              style: AppTextStyle.fifStyle,
                            ),
                            Text('\$32,100', style: AppTextStyle.eigStyle),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 48.h),
              _details(
                Icon(Icons.person_outline, color: primaryColor),
                'Personal Information',
                () {},
              ),
              const Divider(color: primaryColor),
              SizedBox(height: 4.h),
              _details(
                Icon(Icons.payment, color: primaryColor),
                'Payment Methods',
                () {},
              ),
              const Divider(color: primaryColor),
              SizedBox(height: 4.h),
              _details(
                Icon(Icons.notifications_none, color: primaryColor),
                'Notifications',
                () {},
              ),
              const Divider(color: primaryColor),
              SizedBox(height: 4.h),
              _details(
                Icon(Icons.lock_outline, color: primaryColor),
                'Security',
                () {},
              ),
              const Divider(color: primaryColor),
              SizedBox(height: 4.h),
              _details(
                Icon(Icons.quiz_rounded, color: primaryColor),
                'Help & Support',
                () {},
              ),
              const Divider(color: primaryColor),
              SizedBox(height: 4.h),
              _details(
                Icon(Icons.info_outlined, color: primaryColor),
                'About',
                () {},
              ),
              SizedBox(height: 32.h),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: primaryColor),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.file_copy_outlined, color: primaryColor),
                    SizedBox(width: 4.w),
                    Text(
                      'Export Financial Report',
                      style: AppTextStyle.elevStyle,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: thirRedColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.file_copy_outlined, color: redColor),
                    SizedBox(width: 4.w),
                    Text('Logout', style: AppTextStyle.fiftStyle),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _details(Widget icon, String content, dynamic onTap) {
  return Row(
    children: [
      icon,
      SizedBox(width: 4.w),
      Text(content, style: AppTextStyle.sevStyle),
      const Spacer(),
      Icon(Icons.arrow_forward_ios_outlined, color: primaryColor),
    ],
  );
}
