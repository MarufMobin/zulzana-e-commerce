import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.headerText,
    required this.onTabSeeAll,
  });

  final String headerText;
  final VoidCallback onTabSeeAll;

  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(headerText, style: textTheme.titleMedium),
        TextButton(
          onPressed: onTabSeeAll,
          child: Text('See All', style: TextStyle(fontWeight: FontWeight.w600)),
        ),
      ],
    );
  }
}