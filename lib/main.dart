import 'package:clinic_pro/components/modal/patient_detail_model.dart';
import 'package:clinic_pro/components/modal/patient_records_model.dart';
import 'package:clinic_pro/screens/login_screen.dart';
import 'package:clinic_pro/screens/bottom_bar.dart';
import 'package:clinic_pro/screens/patient_detail_screen.dart';
import 'package:clinic_pro/screens/patient_records_screen.dart';
import 'package:clinic_pro/utils/patient_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => ChangeNotifierProvider(create: (_) => PatientProvider(), child: const LoginScreen()),
        '/overview' :(context) => ChangeNotifierProvider(create: (_) => PatientProvider(), child: const BottomBar()),
        '/patientDetail': (context) =>
            ChangeNotifierProvider(create: (context) => PatientDetailModel(), child: const PatientDetailScreen()),
        '/patientRecords': (context) => MultiProvider(
              providers: [
                ChangeNotifierProvider(
                  create: (context) => PatientDetailModel(),
                ),
                ChangeNotifierProvider(
                  create: (context) => PatientRecordsModel(),
                ),
              ],
              child: const PatientRecordsScreen(),
            ),
      },
    );
  }
}
