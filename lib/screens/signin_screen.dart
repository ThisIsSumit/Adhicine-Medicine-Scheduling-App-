import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medicine_app/constants.dart';
import 'package:medicine_app/models/signIn_brain.dart';
import 'package:medicine_app/screens/home_screen.dart';
import 'package:medicine_app/widgets/sign_up.dart';
import 'package:sign_in_button/sign_in_button.dart';

SigninBrain _signinBrain = SigninBrain();

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});
  static String id = "sign_screen";

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String email;
  late String password;

  User? googleUser;
  bool secureText = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: SizedBox(
                    height: 40,
                    child: Text(
                      "logo image",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  textAlign: TextAlign.left,
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
                    style: kElevatedButtonStyle,
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        if (user != null) {
                          Navigator.popAndPushNamed(context, HomeScreen.id);
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 0),
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
                  child: Center(
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
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "New to Adhicine?",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    TextButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return const SizedBox(
                                  child: AlertDialog(
                                    title: Center(child: Text("sign up")),
                                    content:
                                        SizedBox(child: Text("signup page")),
                                  ),
                                );
                              });
                        },
                        child: const Text("Sign Up"))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
