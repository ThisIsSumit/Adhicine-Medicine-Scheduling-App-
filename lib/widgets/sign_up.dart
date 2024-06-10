import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:medicine_app/constants.dart';
import 'package:medicine_app/models/signin_brain.dart';
import 'package:medicine_app/screens/home_screen.dart';

SigninBrain _signinBrain = SigninBrain();

class SignUpPopUp extends StatelessWidget {
  const SignUpPopUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    final FirebaseAuth _auth = FirebaseAuth.instance;
    late String email;
    late String password;
    bool secureText = false;

    return SizedBox(
      child: AlertDialog(
        title: const Center(child: Text("Sign Up")),
        content: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (value) {
                      email = value;
                    },
                    obscureText: secureText,
                    decoration: kformFieldDecoration.copyWith(
                      hintText: "Email",
                      icon: const Icon(Icons.alternate_email_outlined),
                    ),
                    validator: (String? value) =>
                        _signinBrain.validateEmail(value!),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
                  child: TextFormField(
                    onChanged: (value) {
                      password = value;
                    },
                    textAlign: TextAlign.justify,
                    decoration: kformFieldDecoration.copyWith(
                        hintText: "Password",
                        icon: const Icon(Icons.lock_outlined)),
                    validator: (String? value) =>
                        _signinBrain.validatePassword(value!),
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                style: kElevatedButtonStyle,
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    if (await _signinBrain.checkNetworkConnectivity()) {
                      final user = await _auth.createUserWithEmailAndPassword(
                          email: email, password: password);
                      // ignore: unnecessary_null_comparison
                      if (user != null) {
                       
                        Navigator.pop(context);
                        Navigator.pushNamed(context, HomeScreen.id);
                      }
                    }
                  }
                },
                child: const Text(
                  'Sign In',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
