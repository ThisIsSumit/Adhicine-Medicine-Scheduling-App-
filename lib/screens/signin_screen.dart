import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Icon(Icons.medical_services_outlined)),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                textAlign: TextAlign.start,
                "Sign In",
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
              ),
            ),
            Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextFormField(
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                          hintText: "email", border: InputBorder.none),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        hintText: "password",
                        suffixIcon: Icon(Icons.remove_red_eye_outlined),
                        suffixIconColor: Color.fromARGB(103, 0, 0, 0),
                        prefixIcon: Icon(Icons.lock_outline_rounded),
                        prefixIconColor: Color.fromARGB(255, 4, 222, 255),
                        
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        if (value.length < 6) {
                          return 'min length should be 6 ';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Validate will return true if the form is valid, or false if
                    // the form is invalid.
                    if (formKey.currentState!.validate()) {
                      // Process data.
                    }
                  },
                  child: const Text('Sign In'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
