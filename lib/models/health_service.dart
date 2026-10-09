/// Modelul de date pentru o categorie de servicii medicale
/// (ex: Tooth, Eye, Lungs, Ear) afișată pe ecranul principal.
class HealthService {
  /// Textul afișat sub iconiță.
  final String title;

  /// Calea către iconiță din folderul `assets/images/`.
  final String iconAsset;

  const HealthService({
    required this.title,
    required this.iconAsset,
  });
}
