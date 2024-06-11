import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:medicine_app/widgets/no_internet_connection.dart';

class AdhicineBrain {
  Future<bool> checkNetworkConnectivity() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    
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
