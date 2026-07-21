import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zulzana_e_commerce/features/shared/presentation/widgets/centered_progress_indicator.dart';

import '../../../../app/app_colors.dart';
import '../../../shared/presentation/widgets/inc_dec_button.dart';
import '../providers/product_details_provider.dart';
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
  final ProductDetailsProvider _productDetailsProvider =
      ProductDetailsProvider();

  @override
  void initState() {
    super.initState();
    _productDetailsProvider.getProductDetails(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ChangeNotifierProvider.value(
      value: _productDetailsProvider,
      child: Scaffold(
        appBar: AppBar(title: Text('Product Details')),
        body: Consumer<ProductDetailsProvider>(
          builder: (context, _, _) {
            if (_productDetailsProvider.getProductDetailsInProgress) {
              return CenteredProgressIndicator();
            }

            if (_productDetailsProvider.errorMessage != null) {
              return Center(child: Text(_productDetailsProvider.errorMessage!));
            }

            final productModel = _productDetailsProvider.productDetails!;

            return SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ProductImageCarousel(photos: productModel.photos),
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
                                        productModel.title,
                                        style: textTheme.titleMedium?.copyWith(
                                          fontSize: 18,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 90,
                                      child: IncDecButton(
                                        maxCount: productModel.quantity,
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
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 20,
                                        ),
                                        Text('${productModel.rating}'),
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
                                Visibility(
                                  visible: productModel.colors.isNotEmpty,
                                  child: Column(
                                    children: [
                                      _sectionHeader('Color'),
                                      const SizedBox(height: 8),
                                      ColorPicker(
                                        colors: productModel.colors,
                                        onChange: (String selectedColor) {
                                          print(selectedColor);
                                        },
                                      ),
                                      const SizedBox(height: 16),
                                    ],
                                  ),
                                ),
                                Visibility(
                                  visible: productModel.sizes.isNotEmpty,
                                  child: Column(
                                    children: [
                                      _sectionHeader('Size'),
                                      const SizedBox(height: 8),
                                      SizePicker(
                                        sizes: productModel.sizes,
                                        onChange: (String selectedString) {
                                          print(selectedString);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                _sectionHeader('Description'),
                                const SizedBox(height: 8),
                                Text(productModel.description),
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
            );
          },
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
