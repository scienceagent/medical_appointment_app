import 'package:flutter/material.dart';
import '../resources/app_colors.dart';
import 'app_image.dart';
import '../list_items/home_header_list_item.dart';

class HomeHeaderWidget extends StatelessWidget {
  final HomeHeaderListItem item;

  const HomeHeaderWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: AppColors.lightGrey02,
              backgroundImage: AssetImage(item.avatarAsset),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, ${item.userName}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black01,
                  ),
                ),
                const SizedBox(height: 2),
                const Text(
                  'May you always be healthy',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black03,
                  ),
                ),
              ],
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('No new notifications')),
            );
          },
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              const AppImage(
                'assets/icons/ic_notification.svg',
                width: 24,
                height: 24,
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF4D4F),
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.white, width: 1.5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
