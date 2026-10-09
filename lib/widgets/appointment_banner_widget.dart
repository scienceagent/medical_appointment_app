import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../resources/app_colors.dart';
import 'app_image.dart';
import '../list_items/appointment_banner_list_item.dart';
import '../screens/appointment_details_screen.dart';

class AppointmentBannerWidget extends StatelessWidget {
  final AppointmentBannerListItem item;

  const AppointmentBannerWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => AppointmentDetailsScreen(doctor: MockData.doctorUpul),
          ),
        );
      },
      child: SizedBox(
        height: 198,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // 1. Teal card container (height: 148, rounded corners)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 148,
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 18, 20, 14),
                decoration: BoxDecoration(
                  color: AppColors.coralGreen, // Exact Figma #2BACBE
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    // Top header row: "Appointment" and chevron ">"
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Appointment',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        AppImage(
                          'assets/icons/ic_arrow_right.svg',
                          width: 14,
                          height: 14,
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    // Middle row: Date & Time on left, Edit icon button on right
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const AppImage(
                                    'assets/icons/ic_calendar.svg',
                                    width: 16,
                                    height: 16,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    item.date,
                                    style: const TextStyle(
                                      color: AppColors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const AppImage(
                                    'assets/icons/ic_clock.svg',
                                    width: 16,
                                    height: 16,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    item.time,
                                    style: const TextStyle(
                                      color: AppColors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Circular pencil edit button (SVG already includes white circle + teal stroke)
                        const AppImage(
                          'assets/icons/ic_edit.svg',
                          width: 38,
                          height: 38,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // 2. Overlapping white doctor sub-card (protruding at bottom)
            Positioned(
              bottom: 0,
              left: 20,
              right: 20,
              height: 72,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 16,
                      offset: const Offset(0, 8),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        item.doctor.imageAsset,
                        width: 48,
                        height: 48,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            item.doctor.name,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black01,
                            ),
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
                        ],
                      ),
                    ),
                    // Bare message bubble outline icon exactly as in Figma
                    const AppImage(
                      'assets/icons/ic_message.svg',
                      width: 22,
                      height: 22,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
