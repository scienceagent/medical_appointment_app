import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../models/doctor.dart';
import '../resources/app_colors.dart';
import '../widgets/appointment_app_bar.dart';
import '../widgets/booking_button.dart';
import '../widgets/booking_confirmation_dialog.dart';
import '../widgets/chip_selector.dart';
import '../widgets/doctor_profile_card.dart';

class AppointmentDetailsScreen extends StatefulWidget {
  final Doctor doctor;

  const AppointmentDetailsScreen({super.key, required this.doctor});

  @override
  State<AppointmentDetailsScreen> createState() =>
      _AppointmentDetailsScreenState();
}

class _AppointmentDetailsScreenState extends State<AppointmentDetailsScreen> {
  String _selectedHour = MockData.defaultHour;
  String _selectedDate = MockData.defaultDate;

  void _confirmBooking() {
    showDialog(
      context: context,
      builder: (_) => BookingConfirmationDialog(
        doctorName: widget.doctor.name,
        date: _selectedDate,
        time: _selectedHour,
        onDone: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            const AppointmentAppBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 26),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 14),
                    DoctorProfileCard(doctor: widget.doctor),
                    const SizedBox(height: 26),
                    _buildDetailsSection(),
                    const SizedBox(height: 26),
                    ChipSelector(
                      title: 'Working Hours',
                      options: MockData.workingHours,
                      selected: _selectedHour,
                      chipPadding: 16,
                      onSelected: (hour) =>
                          setState(() => _selectedHour = hour),
                    ),
                    const SizedBox(height: 26),
                    ChipSelector(
                      title: 'Date',
                      options: MockData.availableDates,
                      selected: _selectedDate,
                      chipPadding: 22,
                      onSelected: (date) =>
                          setState(() => _selectedDate = date),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
            BookingButton(onPressed: _confirmBooking),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Details',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.black01,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          widget.doctor.about,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.black03,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
