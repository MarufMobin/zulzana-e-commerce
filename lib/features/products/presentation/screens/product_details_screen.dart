import 'package:flutter/material.dart';
import 'package:zulzana_e_commerce/features/products/presentation/widgets/color_picker.dart';
import 'package:zulzana_e_commerce/features/shared/presentation/widgets/inc_dec_button.dart';
import '../../../../app/app_colors.dart';
import '../widgets/product_image_carousel.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  static const String name = 'product-details';
  final String productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: Text('Product Details')),
      body: Column(
        children: [
          ProductImageCarousel(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Adidas Sneaker New Edition 2026 Black',
                        style: textTheme.titleMedium?.copyWith(
                          fontSize: 18,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 90,
                      child: IncDecButton(
                        maxCount: 20,
                        minCount: 1,
                        initialValue: 1,
                        onChange: (newValue) {},
                      ),
                    ),
                  ],
                ),
                Wrap(
                  spacing: 8,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Wrap(
                      spacing: 4,
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 20),
                        Text('4.5'),
                      ],
                    ),
                    TextButton(onPressed: () {}, child: Text('Reviews')),
                    Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: AppColors.themeColor,
                      ),
                      child: Icon(
                        Icons.favorite_outline_rounded,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'Color',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),
                ColorPicker(
                  colors: ['Red', 'Yellow', 'White', 'Black'],
                  onChange: (String selectedColor) {
                    print(selectedColor);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
