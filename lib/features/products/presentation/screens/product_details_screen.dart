import 'package:flutter/material.dart';
import '../../../../app/app_colors.dart';
import '../../../shared/presentation/widgets/inc_dec_button.dart';
import '../widgets/color_picker.dart';
import '../widgets/price_and_cart_section.dart';
import '../widgets/product_image_carousel.dart';
import '../widgets/size_picker.dart';

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
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
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
                              TextButton(
                                onPressed: () {},
                                child: Text('Reviews'),
                              ),
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
                          _sectionHeader('Color'),
                          const SizedBox(height: 8),
                          ColorPicker(
                            colors: ['Red', 'Yellow', 'White', 'Black'],
                            onChange: (String selectedColor) {
                              print(selectedColor);
                            },
                          ),
                          const SizedBox(height: 16),
                          _sectionHeader('Size'),
                          const SizedBox(height: 8),
                          SizePicker(
                            sizes: ['S', 'M', 'L', 'XL'],
                            onChange: (String selectedString) {
                              print(selectedString);
                            },
                          ),
                          _sectionHeader('Description'),
                          const SizedBox(height: 8),
                          Text(
                            '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since 1966, when designers at Letraset and James Mosley, the librarian at St Bride Printing Library in London, took a 1914 Cicero translation and scrambled it to make dummy text for Letraset's Body Type sheets. It has survived not only many decades, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised thanks to these sheets and more recently with desktop publishing software like Aldus PageMaker and Microsoft Word including versions of Lorem Ipsum.''',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            PriceAndCartSection(),
          ],
        ),
      ),
    );
  }

  Widget _sectionHeader(String header) {
    return Text(
      header,
      style: TextStyle(
        color: Colors.black54,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
