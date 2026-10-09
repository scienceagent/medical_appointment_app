import '../models/doctor.dart';
import '../models/health_service.dart';

/// Toate datele de test (mock) ale aplicației, într-un singur loc.
class MockData {
  MockData._();

  // ---------------------------------------------------------------------------
  // Utilizatorul curent (afișat în header-ul ecranului principal)
  // ---------------------------------------------------------------------------
  static const String userName = 'Jonathan';
  static const String userAvatar = 'assets/images/user_jonathan.png';

  // ---------------------------------------------------------------------------
  // Categorii de servicii medicale
  // ---------------------------------------------------------------------------
  static const List<HealthService> healthServices = [
    HealthService(title: 'Tooth', iconAsset: 'assets/images/cat_tooth.png'),
    HealthService(title: 'Eye', iconAsset: 'assets/images/cat_eye.png'),
    HealthService(title: 'Lungs', iconAsset: 'assets/images/cat_lungs.png'),
    HealthService(title: 'Ear', iconAsset: 'assets/images/cat_ear.png'),
  ];

  // ---------------------------------------------------------------------------
  // Medici din apropiere (secțiunea "Nearby Doctor")
  // ---------------------------------------------------------------------------
  static final List<Doctor> nearbyDoctors = [
    Doctor(
      id: '1',
      name: 'Dr. Emmly Lestiryno',
      specialty: 'General Practitioner',
      location: '3167 Durgan Shores',
      distance: '500M',
      imageAsset: 'assets/images/dr_emmly.png',
      fee: '\$90.00',
      about:
          'Worem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.',
    ),
    Doctor(
      id: '2',
      name: 'Dr. Sonja Littel',
      specialty: 'Dental Specialist',
      location: '950 Sigrid Port',
      distance: '753M',
      imageAsset: 'assets/images/dr_sonja.png',
      fee: '\$110.00',
      about:
          'Dr. Sonja Littel specializes in comprehensive dental care, cosmetic dentistry, and gentle oral hygiene treatments.',
    ),
  ];

  // ---------------------------------------------------------------------------
  // Programarea viitoare (afișată în banner-ul de pe ecranul principal)
  // ---------------------------------------------------------------------------
  static final Doctor upcomingDoctor = Doctor(
    id: '3',
    name: 'Dr. Richar Kandowen',
    specialty: 'Child Specialist',
    location: 'Children Health Clinic',
    distance: '1.2 km',
    imageAsset: 'assets/images/dr_richar.png',
    fee: '\$130.00',
    about:
        'Dr. Richar Kandowen is an experienced pediatrician specializing in adolescent healthcare, preventive pediatrics, and childhood developmental health.',
  );
  static const String upcomingDate = '22 October, 2023';
  static const String upcomingTime = '08:00 AM - 10.30 AM';

  // ---------------------------------------------------------------------------
  // Doctorul din ecranul Figma "Appointment detaies"
  // ---------------------------------------------------------------------------
  static final Doctor doctorUpul = Doctor(
    id: '4',
    name: 'Dr.Upul',
    specialty: 'Denteeth',
    location: 'Dental Clinic',
    distance: '800M',
    imageAsset: 'assets/images/dr_upul.png',
    fee: '\$120.00',
    about:
        'Worem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis. Ut commodo efficitur neque. Ut diam quam, semper iaculis condimentum ac, vestibulum eu nisl.',
  );

  // ---------------------------------------------------------------------------
  // Opțiuni de programare (ecranul de detalii)
  // ---------------------------------------------------------------------------
  static const List<String> workingHours = ['10.00 AM', '11.00 AM', '12.00 PM'];
  static const List<String> availableDates = ['Sun 4', 'Mon 5', 'Tue 6'];

  static const String defaultHour = '11.00 AM';
  static const String defaultDate = 'Sun 4';
}
