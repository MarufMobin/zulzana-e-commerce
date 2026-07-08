import 'package:flutter/material.dart';
import '../../../../app/app_colors.dart';

class SizePicker extends StatefulWidget {
  const SizePicker({super.key, required this.sizes, required this.onChange});

  final List<String> sizes;
  final Function(String) onChange;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  String? _selectedSize;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: widget.sizes.map((size) {
        return GestureDetector(
          onTap: () {
            _selectedSize = size;
            widget.onChange(size);
            setState(() {});
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 6),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(4),
              color: _selectedSize == size ? AppColors.themeColor : null,
            ),
            child: Text(
              size,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: _selectedSize == size ? Colors.white : null,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
