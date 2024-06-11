import 'package:get/get.dart';
import 'package:medicine_app/models/network_controller.dart';

class DependencyInjection {
  static void init() {
    Get.put<NetworkController>(NetworkController(), permanent: true);
  }
}
