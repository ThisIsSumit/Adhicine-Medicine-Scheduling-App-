import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:medicine_app/screens/signin_screen.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey:  "AIzaSyCHXfM7zMvHXxQZFDwWL0KqcMqiy5Vl4yE",
            appId: "1:661572391938:android:a4f879094fb93420ab431b",
            messagingSenderId: "661572391938",
            projectId:"medicine-app-321c1",
          ),
        )
      : await Firebase.initializeApp();
  runApp(const MedicineApp());
}

class MedicineApp extends StatelessWidget {
  const MedicineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SignInPage(),
    );
  }
}

