import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LandingScreenController extends GetxController {
  handleLogin() {
    Get.toNamed("/login");
  }

  handleRegister() {
    Get.toNamed("/register");
  }
}
