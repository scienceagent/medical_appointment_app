import 'package:flutter/material.dart';
import '../resources/app_colors.dart';
import 'app_image.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.lightGrey02,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Row(
        children: [
          AppImage(
            'assets/icons/ic_search.svg',
            width: 20,
            height: 20,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              'Search something',
              style: TextStyle(
                color: AppColors.grey01,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          AppImage(
            'assets/icons/ic_filter.svg',
            width: 20,
            height: 20,
          ),
        ],
      ),
    );
  }
}
