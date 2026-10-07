import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/doctor_model.dart';
import '../theme/app_colors.dart';

class HealthServiceItem extends StatelessWidget {
  final HealthService service;
  final VoidCallback? onTap;

  const HealthServiceItem({
    super.key,
    required this.service,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: AppColors.lightGrey02,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.borderGray.withValues(alpha: 0.5),
                width: 1,
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: Image.asset(
              service.iconAsset,
              fit: BoxFit.contain,
              errorBuilder: (_, _, _) => const Icon(
                Icons.medical_services_outlined,
                color: AppColors.coralGreen,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            service.title,
            style: GoogleFonts.outfit(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.black03,
            ),
          ),
        ],
      ),
    );
  }
}
