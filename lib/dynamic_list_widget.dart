import 'package:flutter/material.dart';
import 'data/mock_data.dart';
import 'list_items/appointment_banner_list_item.dart';
import 'list_items/doctor_list_item.dart';
import 'list_items/health_services_list_item.dart';
import 'list_items/home_header_list_item.dart';
import 'list_items/list_item.dart';
import 'list_items/search_list_item.dart';
import 'list_items/section_header_list_item.dart';
import 'widgets/appointment_banner_widget.dart';
import 'widgets/doctor_list_widget.dart';
import 'widgets/health_services_widget.dart';
import 'widgets/home_header_widget.dart';
import 'widgets/search_field_widget.dart';
import 'widgets/section_header_widget.dart';
import 'resources/app_colors.dart';

class DynamicListWidget extends StatefulWidget {
  const DynamicListWidget({super.key});

  @override
  State<DynamicListWidget> createState() => _DynamicListWidgetState();
}

class _DynamicListWidgetState extends State<DynamicListWidget> {
  late List<ListItem> items;

  @override
  void initState() {
    super.initState();
    items = [
      HomeHeaderListItem(
        userName: MockData.userName,
        avatarAsset: MockData.userAvatar,
      ),
      SearchListItem(),
      AppointmentBannerListItem(
        doctor: MockData.upcomingDoctor,
        date: MockData.upcomingDate,
        time: MockData.upcomingTime,
      ),
      SectionHeaderListItem(title: 'Health Services'),
      HealthServicesListItem(services: MockData.healthServices),
      SectionHeaderListItem(title: 'Nearby Doctor'),
    ];
    for (var doctor in MockData.nearbyDoctors) {
      items.add(DoctorListItem(doctor: doctor));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            if (item is HomeHeaderListItem) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: HomeHeaderWidget(item: item),
              );
            }
            if (item is SearchListItem) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: const SearchFieldWidget(),
              );
            }
            if (item is AppointmentBannerListItem) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 22),
                child: AppointmentBannerWidget(item: item),
              );
            }
            if (item is SectionHeaderListItem) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: SectionHeaderWidget(item: item),
              );
            }
            if (item is HealthServicesListItem) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 22),
                child: HealthServicesWidget(item: item),
              );
            }
            if (item is DoctorListItem) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: DoctorListWidget(item: item),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
