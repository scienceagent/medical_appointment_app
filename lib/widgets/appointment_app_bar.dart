import 'package:flutter/material.dart';
import '../../resources/app_colors.dart';
import 'app_image.dart';

class AppointmentAppBar extends StatelessWidget {
  final String title;

  const AppointmentAppBar({
    super.key,
    this.title = 'Appointment',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const AppImage(
                'assets/icons/ic_back.svg',
                width: 14,
                height: 22,
                color: AppColors.black01,
              ),
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.coralGreen,
            ),
          ),
        ],
      ),
    );
  }
}
