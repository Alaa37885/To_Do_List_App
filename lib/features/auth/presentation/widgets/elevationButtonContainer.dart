import 'package:flutter/material.dart';
import 'package:todo_aug_26/core/constants/app_colors.dart';

class ElevationButtonContainer extends StatelessWidget {
  final String text;

  const ElevationButtonContainer({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: AppColors.primary,
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}