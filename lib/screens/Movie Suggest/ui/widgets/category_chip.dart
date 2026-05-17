import 'package:cineluxe/utils/app_colors.dart';
import 'package:flutter/material.dart';

Widget categoryItem(String text, bool selected) {
  return Container(
    margin: const EdgeInsets.only(left: 16),

    padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),

    decoration: BoxDecoration(
      color: selected ? AppColors.yellowColor : AppColors.textFormFieldBg,

      borderRadius: BorderRadius.circular(16),

      border: Border.all(
        color: selected
            ? AppColors.yellowColor
            : Colors.transparent,
      )


    ),

    child: Center(
      child: Text(
        text,

        style: TextStyle(
          color: selected ? Colors.black : Colors.white,

          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    ),
  );
}
