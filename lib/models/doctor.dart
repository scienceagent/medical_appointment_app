/// Modelul de date pentru un medic.
///
/// Conține toate informațiile afișate în listă și în ecranul de detalii.
/// Pentru a adăuga un câmp nou (ex: rating), adaugă-l aici și în constructor.
class Doctor {
  /// Identificator unic al medicului.
  final String id;

  /// Numele complet (ex: "Dr. Sonja Littel").
  final String name;

  /// Specialitatea medicală (ex: "Dental Specialist").
  final String specialty;

  /// Adresa cabinetului.
  final String location;

  /// Distanța față de utilizator (ex: "500M").
  final String distance;

  /// Calea către poza medicului din folderul `assets/images/`.
  final String imageAsset;

  /// Tariful consultației (ex: "$90.00").
  final String fee;

  /// Scurtă descriere a medicului.
  final String about;

  /// Singurul câmp modificabil: dacă medicul este marcat ca favorit.
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
