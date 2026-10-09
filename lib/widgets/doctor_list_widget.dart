import 'package:flutter/material.dart';
import '../resources/app_colors.dart';
import 'app_image.dart';
import '../list_items/doctor_list_item.dart';
import '../screens/appointment_details_screen.dart';

class DoctorListWidget extends StatelessWidget {
  final DoctorListItem item;

  const DoctorListWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => AppointmentDetailsScreen(doctor: item.doctor),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 26,
              backgroundColor: AppColors.lightGrey02,
              backgroundImage: AssetImage(item.doctor.imageAsset),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item.doctor.name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black01,
                        ),
                      ),
                      const AppImage(
                        'assets/icons/ic_heart.svg',
                        width: 18,
                        height: 18,
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Text(
                    item.doctor.specialty,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black03,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const AppImage(
                        'assets/icons/ic_location.svg',
                        width: 14,
                        height: 14,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          '${item.doctor.location} - ${item.doctor.distance} from you',
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black03,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
