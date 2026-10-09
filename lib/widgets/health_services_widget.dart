import 'package:flutter/material.dart';
import '../resources/app_colors.dart';
import '../list_items/health_services_list_item.dart';
import '../models/health_service.dart';

class HealthServicesWidget extends StatelessWidget {
  final HealthServicesListItem item;

  const HealthServicesWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: item.services
          .map((service) => _HealthServiceItemView(service: service))
          .toList(),
    );
  }
}

class _HealthServiceItemView extends StatelessWidget {
  final HealthService service;

  const _HealthServiceItemView({required this.service});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: AppColors.lightGrey03,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Image.asset(
              service.iconAsset,
              width: 32,
              height: 32,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          service.title,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: AppColors.black03,
          ),
        ),
      ],
    );
  }
}
