import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/doctor_model.dart';
import '../theme/app_colors.dart';

class AppointmentDetailsScreen extends StatefulWidget {
  final Doctor? doctor;

  const AppointmentDetailsScreen({
    super.key,
    this.doctor,
  });

  @override
  State<AppointmentDetailsScreen> createState() => _AppointmentDetailsScreenState();
}

class _AppointmentDetailsScreenState extends State<AppointmentDetailsScreen> {
  String _selectedHour = '11.00 AM';
  String _selectedDate = 'Sun 4';

  final List<String> _workingHours = ['10.00 AM', '11.00 AM', '12.00 PM'];
  final List<String> _dates = ['Sun 4', 'Mon 5', 'Tue 6'];

  void _confirmBooking() {
    final doctorName = widget.doctor?.name ?? 'Dr. Upul';
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            const Icon(Icons.check_circle_rounded, color: AppColors.green, size: 28),
            const SizedBox(width: 8),
            Text(
              'Booking Confirmed',
              style: GoogleFonts.openSans(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.black01,
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your appointment with $doctorName is scheduled!',
              style: GoogleFonts.openSans(
                fontSize: 14,
                color: AppColors.black01,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.lightGrey02,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Date: $_selectedDate',
                    style: GoogleFonts.openSans(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                  Text(
                    'Time: $_selectedHour',
                    style: GoogleFonts.openSans(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // close dialog
              Navigator.of(context).pop(); // return to home
            },
            child: Text(
              'Done',
              style: GoogleFonts.openSans(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final doctorName = widget.doctor?.name ?? 'Dr.Upul';
    final doctorSpecialty = widget.doctor != null
        ? (widget.doctor!.specialty.toLowerCase().contains('dent') ? 'denteeth' : widget.doctor!.specialty)
        : 'denteeth';
    final doctorImage = widget.doctor?.imageAsset ?? 'assets/images/dr_upul.png';
    final doctorFee = widget.doctor?.fee ?? '\$120.00';

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top Navigation & Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Image.asset(
                        'assets/images/ic_back.png',
                        width: 28,
                        height: 28,
                        errorBuilder: (_, _, _) => const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: AppColors.black01,
                          size: 22,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Appointment',
                    style: GoogleFonts.openSans(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                      letterSpacing: -0.5,
                    ),
                  ),
                ],
              ),
            ),

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),

                    // Doctor Profile Card
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Doctor Image
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: AppColors.borderGray,
                              width: 1,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(9),
                            child: Image.asset(
                              doctorImage,
                              fit: BoxFit.cover,
                              errorBuilder: (_, _, _) => Container(
                                color: AppColors.lightGrey02,
                                child: const Icon(Icons.person, size: 50, color: AppColors.grey01),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),

                        // Doctor Details + Action Icons
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      doctorName,
                                      style: GoogleFonts.openSans(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.black02,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      _buildActionButton('assets/images/ic_action1.png', Icons.phone_rounded),
                                      const SizedBox(width: 6),
                                      _buildActionButton('assets/images/ic_action2.png', Icons.chat_rounded),
                                      const SizedBox(width: 6),
                                      _buildActionButton('assets/images/ic_action3.png', Icons.videocam_rounded),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Text(
                                doctorSpecialty,
                                style: GoogleFonts.openSans(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.secondary,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Payment',
                                    style: GoogleFonts.openSans(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.black02,
                                    ),
                                  ),
                                  Text(
                                    doctorFee,
                                    style: GoogleFonts.openSans(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.secondary,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),

                    // Details Section
                    Text(
                      'Details',
                      style: GoogleFonts.openSans(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black02,
                        letterSpacing: -0.4,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.doctor?.about ??
                          'Worem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis. Ut commodo efficitur neque. Ut diam quam, semper iaculis condimentum ac, vestibulum eu nisl.',
                      style: GoogleFonts.openSans(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textGray,
                        height: 1.45,
                      ),
                    ),
                    const SizedBox(height: 28),

                    // Working Hours Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Working Hours',
                          style: GoogleFonts.openSans(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black02,
                            letterSpacing: -0.4,
                          ),
                        ),
                        Text(
                          'See All',
                          style: GoogleFonts.openSans(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black02,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: _workingHours.map((hour) {
                        final isSelected = hour == _selectedHour;
                        return GestureDetector(
                          onTap: () => setState(() => _selectedHour = hour),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                            decoration: BoxDecoration(
                              color: isSelected ? AppColors.primary : AppColors.chipBackground,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              hour,
                              style: GoogleFonts.openSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: isSelected ? AppColors.white : AppColors.black02,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 28),

                    // Date Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Date',
                          style: GoogleFonts.openSans(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: AppColors.black02,
                            letterSpacing: -0.4,
                          ),
                        ),
                        Text(
                          'See All',
                          style: GoogleFonts.openSans(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black02,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: _dates.map((date) {
                        final isSelected = date == _selectedDate;
                        return GestureDetector(
                          onTap: () => setState(() => _selectedDate = date),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                            decoration: BoxDecoration(
                              color: isSelected ? AppColors.primary : AppColors.chipBackground,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              date,
                              style: GoogleFonts.openSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: isSelected ? AppColors.white : AppColors.black02,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 36),
                  ],
                ),
              ),
            ),

            // Bottom Action Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _confirmBooking,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Book an Appointment',
                    style: GoogleFonts.openSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(String assetPath, IconData fallbackIcon) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: AppColors.lightGrey02,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.borderGray.withValues(alpha: 0.5)),
      ),
      child: Image.asset(
        assetPath,
        width: 16,
        height: 16,
        errorBuilder: (_, _, _) => Icon(
          fallbackIcon,
          size: 16,
          color: AppColors.primary,
        ),
      ),
    );
  }
}
