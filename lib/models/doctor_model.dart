class Doctor {
  final String id;
  final String name;
  final String specialty;
  final String location;
  final String distance;
  final String imageAsset;
  final String fee;
  final String about;
  bool isFavorite;

  Doctor({
    required this.id,
    required this.name,
    required this.specialty,
    required this.location,
    required this.distance,
    required this.imageAsset,
    required this.fee,
    required this.about,
    this.isFavorite = false,
  });
}

class HealthService {
  final String title;
  final String iconAsset;

  const HealthService({
    required this.title,
    required this.iconAsset,
  });
}
