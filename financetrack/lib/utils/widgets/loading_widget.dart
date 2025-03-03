import 'package:financetrack/common/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.size = 70});
  final double size;

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.threeArchedCircle(
      color: primaryColor,
      size: size,
    );
  }
}

void showCircleLoader({double size = 70, String? message}) => Get.dialog(
  Dialog(
    backgroundColor: Colors.white,
    elevation: 0,
    child: Container(
      height: 200,
      width: 200,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LoadingWidget(size: size),
          if (message != null)
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
        ],
      ),
    ),
  ),
  barrierDismissible: true,
);
void hideLoader() => Get.back();
