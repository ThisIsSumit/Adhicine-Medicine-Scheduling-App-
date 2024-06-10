import 'package:flutter/material.dart';
import 'package:sign_in_button/sign_in_button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    bool secureText = false;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        obscureText: secureText,
                        decoration: const InputDecoration(
                            icon: Icon(Icons.alternate_email_outlined),
                            iconColor: Color.fromARGB(255, 4, 222, 255),
                            hintText: "Email",
                            border: UnderlineInputBorder(),
                            contentPadding: EdgeInsets.only(left: 10)),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
                      child: TextFormField(
                        textAlign: TextAlign.justify,
                        decoration: const InputDecoration(
                            iconColor: Color.fromARGB(255, 4, 222, 255),
                            icon: Icon(Icons.lock_outline_rounded),
                            hintText: "Password",
                            suffixIcon: Icon(Icons.remove_red_eye_outlined),
                            suffixIconColor: Color.fromARGB(103, 0, 0, 0),
                            border: UnderlineInputBorder(),
                            contentPadding: EdgeInsets.only(left: 10)),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          if (value.length < 6) {
                            return 'min. length should be 6 ';
                          }
                          return null;
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Forget Password ?",
                            style: TextStyle(),
                          )),
                    )
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                      fixedSize: const Size(320, 50),
                      backgroundColor: const Color.fromARGB(193, 105, 57, 251)),
                  onPressed: () {
                    // Validate will reconst turn true if the form is valid, or false if
                    // the form is invalid.
                    if (formKey.currentState!.validate()) {
                      // Process data.
                    }
                  },
                  child: const Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.7,
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    child: Text("OR"),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.7,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: 300.0, // Set the desired width
                  height: 50.0, // Set the desired height
                  child: SignInButton(
                    shape: const StadiumBorder(
                      side: BorderSide(),
                    ),
                    Buttons.google,
                    onPressed: () {},
                    text: "Continue with Google",
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "New to Adhicine?",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  TextButton(onPressed: () {}, child: const Text("Sign Up"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
