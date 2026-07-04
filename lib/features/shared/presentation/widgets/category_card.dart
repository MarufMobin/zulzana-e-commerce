import 'package:flutter/material.dart';
import '../../../../app/app_colors.dart';
import '../../../products/presentation/screens/product_list_by_category_screen.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    // required this.categoryId,
    // required this.categoryName,
  });

  final String categoryId = 'amr';
  final String categoryName = 'sdakfjds';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductListByCategoryScreen.name,
          arguments: {'categoryId': categoryId, 'categoryName': categoryName},
        );
      },
      child: Column(
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
      ),
    );
  }
}
