import 'package:cineluxe/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../utils/app_sizes.dart';

class CustomizedElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color? backgroundColor ;
  final bool isOutlined ;
  const CustomizedElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.backgroundColor,
    this.isOutlined = false
  });

  @override
  Widget build(BuildContext context) {
    var height = context.height;
    var width = context.width;
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          isOutlined ? Colors.transparent :
          (backgroundColor ?? AppColors.yellowColor),),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: isOutlined
                ? const BorderSide(
              color: AppColors.yellowColor,
              width: 1.5,
            )
                : BorderSide.none,
          ),
        ),
        elevation: WidgetStateProperty.all(0),
        padding: WidgetStateProperty.all(
          EdgeInsets.symmetric(
            horizontal: width * 0.04,
            vertical: height * 0.014,
          ),
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
