import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.themeColor.withAlpha(20),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.all(16),
          child: Icon(Icons.computer, size: 48, color: AppColors.themeColor),
        ),
        const SizedBox(height: 4),
        Text(
          'Electronics',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: AppColors.themeColor,
          ),
        ),
      ],
    );
  }
}