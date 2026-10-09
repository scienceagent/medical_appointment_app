import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dynamic_list_widget.dart';
import 'resources/app_theme.dart';

/// Punctul de intrare al aplicației.
void main() {
  // Necesar înainte de a configura sistemul (bara de stare).
  WidgetsFlutterBinding.ensureInitialized();

  // Bara de stare (ora, bateria) transparentă, cu iconițe închise la culoare.
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(const MedicalAppointmentApp());
}

/// Widget-ul rădăcină: configurează tema și primul ecran afișat.
class MedicalAppointmentApp extends StatelessWidget {
  const MedicalAppointmentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medical Appointment',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(context),
      home: const DynamicListWidget(),
    );
  }
}
