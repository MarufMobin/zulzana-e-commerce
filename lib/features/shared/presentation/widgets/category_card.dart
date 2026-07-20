import 'package:flutter/material.dart';
import '../../../../app/app_colors.dart';
import '../../../category/data/models/category_model.dart';
import '../../../products/presentation/screens/product_list_by_category_screen.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.categoryModel});

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductListByCategoryScreen.name,
          arguments: {
            'categoryId': categoryModel.id,
            'categoryName': categoryModel.title,
          },
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
            child: Image.network(
              categoryModel.icon,
              width: 48,
              height: 48,
              errorBuilder: (_, _, _) {
                return Icon(Icons.error_outline, size: 48, color: Colors.grey);
              },
            ),
          ),
          const SizedBox(height: 4),
          Text(
            categoryModel.title,
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
