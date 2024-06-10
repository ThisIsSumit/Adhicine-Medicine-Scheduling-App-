import 'package:connectivity_plus/connectivity_plus.dart';

class SigninBrain {
  SigninBrain();

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

 Future<bool> checkNetworkConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    // ignore: unrelated_type_equality_checks
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    }
    return true;
  }

}
