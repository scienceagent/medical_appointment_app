import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class AppointmentBanner extends StatelessWidget {
  final VoidCallback? onTap;

  const AppointmentBanner({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 198,
        width: double.infinity,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Teal Top Card
            Container(
              height: 145,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: AppColors.coralGreen,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  // Top Row: "Appointment" & Arrow
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Appointment',
                        style: GoogleFonts.outfit(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 14,
                        color: AppColors.white,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Middle Row: Date/Time + Illustration
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.calendar_today_outlined,
                                size: 16,
                                color: AppColors.white,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '22 October, 2023',
                                style: GoogleFonts.outfit(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(
                                Icons.access_time_rounded,
                                size: 16,
                                color: AppColors.white,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '08:00 AM - 10.30 AM',
                                style: GoogleFonts.outfit(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/images/appointment_illustration.png',
                        width: 44,
                        height: 44,
                        fit: BoxFit.contain,
                        errorBuilder: (_, _, _) => const Icon(
                          Icons.medical_services_outlined,
                          size: 36,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Floating Bottom Doctor Card
            Positioned(
              left: 16,
              right: 16,
              bottom: 0,
              child: Container(
                height: 67,
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 24,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/dr_richar.png',
                        width: 44,
                        height: 44,
                        fit: BoxFit.cover,
                        errorBuilder: (_, _, _) => Container(
                          width: 44,
                          height: 44,
                          color: AppColors.borderGray,
                          child: const Icon(Icons.person, color: AppColors.black03),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Dr. Richar Kandowen',
                            style: GoogleFonts.outfit(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black01,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Child Specialist',
                            style: GoogleFonts.outfit(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black03,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: AppColors.coralGreen.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.chat_bubble_outline_rounded,
                        size: 18,
                        color: AppColors.coralGreen,
                      ),
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
