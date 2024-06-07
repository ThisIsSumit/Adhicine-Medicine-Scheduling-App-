import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() {
    return _SignInPageState();
  }
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  User? user;

  @override
  void initState() {
    super.initState();
    _auth.authStateChanges().listen((event) {
      setState(() {
        user = event;
      });
    });
  }

  Future<void> signInWithGoogle() async {
    try {
      GoogleAuthProvider _googleAuthProvider = GoogleAuthProvider();
      _auth.signInWithProvider(_googleAuthProvider);

    } catch (e) {
      print(e);
    }
  }

  Future<bool> checkNetworkConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    }
    return true;
  }

  void showNetworkDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('No Network Connection'),
          content: const Text(
              'Please check your internet connection and try again.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> addMedicine(String name, String dosage) async {
    await FirebaseFirestore.instance.collection('medicines').add({
      'name': name,
      'dosage': dosage,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  Future<void> sendNotification(String title, String body) async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    await messaging.subscribeToTopic('medicine_notifications');

    await FirebaseFirestore.instance.collection('notifications').add({
      'title': title,
      'body': body,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  String? validateEmail(String email) {
    if (email.isEmpty) return 'Email is required.';
    String pattern = r'\w+@\w+\.\w+';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(email)) return 'Enter a valid email address.';
    return null;
  }

  String? validatePassword(String password) {
    if (password.isEmpty) return 'Password is required.';
    if (password.length < 8) {
      return 'Password must be at least 8 characters long.';
    }
    if (!RegExp(r'[0-9]').hasMatch(password)) {
      return 'Password must contain at least one number.';
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) {
      return 'Password must contain at least one special character.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(hintText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(hintText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () async {
                if (validateEmail(_emailController.text) == null &&
                    validatePassword(_passwordController.text) == null) {
                  if (await checkNetworkConnectivity()) {
                    if (user != null) {
                      await addMedicine('Paracetamol', '500mg');
                      await sendNotification('New Medicine Added',
                          'Paracetamol 500mg added to your list.');
                    }
                  } else {
                    showNetworkDialog(context);
                  }
                } else {
                  // Handle validation errors
                }
              },
              child: const Text('Sign In with Google'),
            ),
          ],
        ),
      ),
    );
  }
}
