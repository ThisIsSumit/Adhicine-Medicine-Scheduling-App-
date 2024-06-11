import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:medicine_app/widgets/no_internet_connection.dart';

class AdhicineBrain {
  Future<bool> checkNetworkConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    // ignore: unrelated_type_equality_checks
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    }
    return true;
  }

  void noInternnetPop(context) async {
    showDialog(
        context: context,
        builder: (context) {
          return const NoInternetConnection();
        });
  }
}
