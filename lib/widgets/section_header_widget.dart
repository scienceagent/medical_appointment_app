import 'package:flutter/material.dart';
import '../resources/app_colors.dart';
import '../list_items/section_header_list_item.dart';

class SectionHeaderWidget extends StatelessWidget {
  final SectionHeaderListItem item;

  const SectionHeaderWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          item.title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.black01,
          ),
        ),
        const Text(
          'See All',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.coralGreen,
          ),
        ),
      ],
    );
  }
}
