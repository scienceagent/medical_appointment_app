import 'package:flutter/material.dart';
import '../../models/doctor.dart';
import '../../resources/app_colors.dart';
import 'contact_action_button.dart';

class DoctorProfileCard extends StatelessWidget {
  final Doctor doctor;

  const DoctorProfileCard({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Image.asset(
            doctor.imageAsset,
            width: 88,
            height: 88,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      doctor.name,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black01,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const ContactActionButton(
                    iconAsset: 'assets/icons/ic_action2.svg',
                  ),
                  const SizedBox(width: 5),
                  const ContactActionButton(
                    iconAsset: 'assets/icons/ic_action1.svg',
                  ),
                  const SizedBox(width: 5),
                  const ContactActionButton(
                    iconAsset: 'assets/icons/ic_action3.svg',
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                doctor.specialty,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: AppColors.coralGreen,
                ),
              ),
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Payment',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black01,
                    ),
                  ),
                  Text(
                    doctor.fee,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: AppColors.coralGreen,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
