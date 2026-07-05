import 'package:flutter/material.dart';
import '../../../../app/app_colors.dart';
import '../../../../app/constants.dart';

class TotalPriceAndCheckOutSection extends StatelessWidget {
  const TotalPriceAndCheckOutSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withAlpha(30),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Total Price',style: TextStyle(
                  fontWeight: FontWeight.w600
              ),),
              Text(
                '${Constants.takaSign}200',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: AppColors.themeColor,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 140,
            child: FilledButton(
              onPressed: () {},
              child: Text('Check Out'),
            ),
          ),
        ],
      ),
    );
  }
}
