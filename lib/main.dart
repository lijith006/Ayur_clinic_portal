import 'package:ayur_clinic_portal/core/api_client.dart';
import 'package:ayur_clinic_portal/core/app_text_styles.dart';
import 'package:ayur_clinic_portal/core/secure_storage_service.dart';
import 'package:ayur_clinic_portal/providers/auth_provider.dart';
import 'package:ayur_clinic_portal/providers/branch_treatment_provider.dart';
import 'package:ayur_clinic_portal/providers/patient_provider.dart';
import 'package:ayur_clinic_portal/repositories/patient_repository.dart';
import 'package:ayur_clinic_portal/screens/login_screen.dart';
import 'package:ayur_clinic_portal/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  final storage = SecureStorageService();
  final apiClient = ApiClient(storage);
  final patientRepository = PatientRepository(apiClient);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider(apiClient, storage)),
        ChangeNotifierProvider(
          create: (_) => PatientProvider(patientRepository),
        ),
        ChangeNotifierProvider(
          create: (_) => BranchProvider(patientRepository),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
      },
      title: 'Ayur Clinic Portal',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.green,
        textTheme: const TextTheme(
          headlineLarge: AppTextStyles.headlineLarge,
          headlineMedium: AppTextStyles.headlineMedium,
          bodyMedium: AppTextStyles.bodyMedium,
          bodySmall: AppTextStyles.bodySmall,
        ),
      ),
      home: const LoginScreen(),
    );
  }
}
