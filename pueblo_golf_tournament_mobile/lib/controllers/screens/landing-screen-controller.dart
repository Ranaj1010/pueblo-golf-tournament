import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LandingScreenController extends GetxController {
  var baseUrl = "".obs;

  LandingScreenController() {
    baseUrl(
        FlavorConfig.instance.variables["baseUrl"] ?? dotenv.env["BASE_URL"]);
  }

  handleLogin() {
    Get.toNamed("/login");
  }

  handleRegister() {
    Get.toNamed("/register");
  }
}
