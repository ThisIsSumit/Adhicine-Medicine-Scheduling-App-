import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:medicine_app/models/dependency_injection.dart';
import 'package:medicine_app/screens/forget_password.dart';
import 'package:medicine_app/screens/home_screen.dart';
import 'package:medicine_app/screens/profile_screen.dart';
import 'package:medicine_app/pages.dart/report_page.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: "AIzaSyCHXfM7zMvHXxQZFDwWL0KqcMqiy5Vl4yE",
            appId: "1:661572391938:android:a4f879094fb93420ab431b",
            messagingSenderId: "661572391938",
            projectId: "medicine-app-321c1",
          ),
        )
      : await Firebase.initializeApp();
  runApp(const MedicineApp());
  DependencyInjection.init();
}

class MedicineApp extends StatelessWidget {
  const MedicineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
      routes: {
        HomeScreen.id: (context) => const HomeScreen(),
        ProfileScreen.id: (context) => const ProfileScreen(),
        ReportScreen.id: (context) => const ReportScreen(),
        ForgetPassword.id: (context) => const ForgetPassword(),
      },
    );
  }
}
