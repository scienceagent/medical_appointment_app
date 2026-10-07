import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/doctor_model.dart';
import '../theme/app_colors.dart';

class DoctorListItem extends StatefulWidget {
  final Doctor doctor;
  final VoidCallback? onTap;

  const DoctorListItem({
    super.key,
    required this.doctor,
    this.onTap,
  });

  @override
  State<DoctorListItem> createState() => _DoctorListItemState();
}

class _DoctorListItemState extends State<DoctorListItem> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.doctor.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Doctor Profile Avatar
            ClipOval(
              child: Image.asset(
                widget.doctor.imageAsset,
                width: 48,
                height: 48,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => Container(
                  width: 48,
                  height: 48,
                  color: AppColors.lightGrey02,
                  child: const Icon(Icons.person, color: AppColors.black03),
                ),
              ),
            ),
            const SizedBox(width: 14),

            // Doctor Information
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.doctor.name,
                    style: GoogleFonts.outfit(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black01,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    widget.doctor.specialty,
                    style: GoogleFonts.outfit(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black03,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_rounded,
                        size: 14,
                        color: AppColors.coralGreen,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          '${widget.doctor.location} - ${widget.doctor.distance} from you',
                          style: GoogleFonts.outfit(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black01,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Favorite Button
            IconButton(
              onPressed: () {
                setState(() {
                  _isFavorite = !_isFavorite;
                  widget.doctor.isFavorite = _isFavorite;
                });
              },
              icon: Icon(
                _isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                color: _isFavorite ? Colors.redAccent : AppColors.grey01,
                size: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
