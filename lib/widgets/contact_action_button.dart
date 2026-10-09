import 'package:flutter/material.dart';
import 'app_image.dart';

/// Buton rotund de contact (apel, chat, video) din cardul medicului.
class ContactActionButton extends StatelessWidget {
  final String iconAsset;
  final VoidCallback? onTap;

  const ContactActionButton({
    super.key,
    required this.iconAsset,
    this.onTap,
    IconData? fallbackIcon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AppImage(
        iconAsset,
        width: 30,
        height: 30,
      ),
    );
  }
}
