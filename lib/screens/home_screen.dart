import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/doctor_model.dart';
import '../theme/app_colors.dart';
import '../widgets/appointment_banner.dart';
import '../widgets/health_service_item.dart';
import '../widgets/doctor_list_item.dart';
import 'appointment_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<HealthService> _healthServices = const [
    HealthService(title: 'Tooth', iconAsset: 'assets/images/cat_tooth.png'),
    HealthService(title: 'Eye', iconAsset: 'assets/images/cat_eye.png'),
    HealthService(title: 'Lungs', iconAsset: 'assets/images/cat_lungs.png'),
    HealthService(title: 'Ear', iconAsset: 'assets/images/cat_ear.png'),
  ];

  final List<Doctor> _nearbyDoctors = [
    Doctor(
      id: '1',
      name: 'Dr. Emmly Lestiryno',
      specialty: 'General Practitioner',
      location: '3167 Durgan Shores',
      distance: '500M',
      imageAsset: 'assets/images/dr_emmly.png',
      fee: '\$90.00',
      about:
          'Dr. Emmly Lestiryno is an experienced general practitioner dedicated to holistic patient care and preventative medicine.',
    ),
    Doctor(
      id: '2',
      name: 'Dr. Sonja Littel',
      specialty: 'Dental Specialist',
      location: '950 Sigrid Port',
      distance: '753M',
      imageAsset: 'assets/images/dr_sonja.png',
      fee: '\$110.00',
      about:
          'Dr. Sonja Littel specializes in comprehensive dental care, cosmetic dentistry, and gentle oral hygiene treatments.',
    ),
  ];

  void _navigateToDetails(Doctor doctor) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AppointmentDetailsScreen(doctor: doctor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Top Header Row (User Profile + Notification)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(22),
                        child: Image.asset(
                          'assets/images/user_jonathan.png',
                          width: 44,
                          height: 44,
                          fit: BoxFit.cover,
                          errorBuilder: (_, _, _) => Container(
                            width: 44,
                            height: 44,
                            color: AppColors.lightGrey02,
                            child: const Icon(Icons.person, color: AppColors.coralGreen),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi, Jonathan',
                            style: GoogleFonts.outfit(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black01,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'May you always be healthy',
                            style: GoogleFonts.outfit(
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black03,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: AppColors.lightGrey02,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.borderGray.withValues(alpha: 0.4),
                      ),
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('No new notifications')),
                        );
                      },
                      icon: Image.asset(
                        'assets/images/ic_notification.png',
                        width: 22,
                        height: 22,
                        errorBuilder: (_, _, _) => const Icon(
                          Icons.notifications_none_rounded,
                          size: 22,
                          color: AppColors.black01,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // 2. Search Bar
              Container(
                height: 52,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: AppColors.lightGrey03,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: AppColors.borderGray,
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.search_rounded,
                      color: AppColors.grey01,
                      size: 22,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search something',
                          hintStyle: GoogleFonts.outfit(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.grey01,
                          ),
                          border: InputBorder.none,
                          isDense: true,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.tune_rounded,
                      color: AppColors.black01,
                      size: 22,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // 3. Appointment Card (Banner)
              AppointmentBanner(
                onTap: () {
                  _navigateToDetails(
                    Doctor(
                      id: '3',
                      name: 'Dr. Richar Kandowen',
                      specialty: 'Child Specialist',
                      location: 'Children Health Clinic',
                      distance: '1.2 km',
                      imageAsset: 'assets/images/dr_richar.png',
                      fee: '\$130.00',
                      about:
                          'Dr. Richar Kandowen is an experienced pediatrician specializing in adolescent healthcare, preventive pediatrics, and childhood developmental health.',
                    ),
                  );
                },
              ),
              const SizedBox(height: 28),

              // 4. Health Services Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Health Services',
                    style: GoogleFonts.outfit(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black01,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'See All',
                      style: GoogleFonts.outfit(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.coralGreen,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: _healthServices
                    .map((service) => HealthServiceItem(service: service))
                    .toList(),
              ),
              const SizedBox(height: 28),

              // 5. Nearby Doctor Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Nearby Doctor',
                    style: GoogleFonts.outfit(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black01,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'See All',
                      style: GoogleFonts.outfit(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.coralGreen,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ..._nearbyDoctors.map(
                (doctor) => DoctorListItem(
                  doctor: doctor,
                  onTap: () => _navigateToDetails(doctor),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
