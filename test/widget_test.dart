import 'package:flutter_test/flutter_test.dart';
import 'package:medical_appointment_app/main.dart';

void main() {
  testWidgets('App renders home screen with greeting and sections', (WidgetTester tester) async {
    await tester.pumpWidget(const MedicalAppointmentApp());
    await tester.pumpAndSettle();

    // Verify key elements from Figma Homescreen
    expect(find.text('Hi, Jonathan'), findsOneWidget);
    expect(find.text('Health Services'), findsOneWidget);
    expect(find.text('Nearby Doctor'), findsOneWidget);
    expect(find.text('Appointment'), findsOneWidget);
  });
}
