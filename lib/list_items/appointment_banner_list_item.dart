import 'list_item.dart';
import '../models/doctor.dart';
class AppointmentBannerListItem extends ListItem {
  final Doctor doctor;
  final String date;
  final String time;
  AppointmentBannerListItem({required this.doctor, required this.date, required this.time});
}

