import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingAnimation extends StatelessWidget {
  final Color color;
  final double height;

  const LoadingAnimation({
    super.key,
    this.color = Colors.white,
    this.height = 15,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.inkDrop(color: color, size: height),
    );
  }
}
