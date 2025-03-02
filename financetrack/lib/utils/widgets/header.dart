import 'package:financetrack/common/constants/text_styles.dart';
import 'package:flutter/material.dart';

Widget header() {
  return Align(
    alignment: Alignment.center,
    child: Column(
      children: [
        Image.asset('assets/images/app_logo.png', height: 48, width: 48),
        Text('FinTrack', style: AppTextStyle.sixStyle),
      ],
    ),
  );
}
