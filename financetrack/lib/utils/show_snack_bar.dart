import 'package:financetrack/common/constants/colors.dart';
import 'package:financetrack/common/constants/text_styles.dart';
import 'package:flutter/material.dart';

enum Status { success, error }

void showSnackBar({
  required BuildContext context,
  required Status status,
  required String message,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: status == Status.success ? primaryColor : redColor,
      content: Row(
        children: [
          Expanded(
            child: Text(
              message,
              style: AppTextStyle.fifStyle,
            ),
          ),
          Icon(
            status == Status.success
                ? Icons.mood
                : Icons.sentiment_dissatisfied,
            color: whiteColor,
          )
        ],
      ),
      duration: const Duration(seconds: 2),
    ),
  );
}