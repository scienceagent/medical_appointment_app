import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../resources/app_colors.dart';

/// Fereastra de confirmare afișată după apăsarea pe „Book an Appointment”.
///
/// Arată medicul, data și ora alese. Butonul „Done” apelează [onDone].
class BookingConfirmationDialog extends StatelessWidget {
  final String doctorName;
  final String date;
  final String time;

  /// Acțiunea la apăsarea pe „Done” (ex: închide dialogul și revine acasă).
  final VoidCallback onDone;

  const BookingConfirmationDialog({
    super.key,
    required this.doctorName,
    required this.date,
    required this.time,
    required this.onDone,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),

      // Titlu: bifă verde + „Booking Confirmed”
      title: Row(
        children: [
          // Removed Material icon to match constraint
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

      // Conținut: mesaj + rezumatul datei și orei
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your appointment with $doctorName is scheduled!',
            style: GoogleFonts.openSans(fontSize: 14, color: AppColors.black01),
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
                Text('Date: $date', style: _summaryStyle),
                Text('Time: $time', style: _summaryStyle),
              ],
            ),
          ),
        ],
      ),

      // Butonul „Done”
      actions: [
        TextButton(
          onPressed: onDone,
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
    );
  }

  /// Stilul textelor „Date: ...” și „Time: ...”.
  TextStyle get _summaryStyle => GoogleFonts.openSans(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: AppColors.primary,
      );
}
