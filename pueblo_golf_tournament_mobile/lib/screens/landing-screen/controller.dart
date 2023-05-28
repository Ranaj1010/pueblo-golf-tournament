import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pueblo_golf_tournament_mobile/screens/landing-screen/interface.dart';

class LandingScreenController extends ILandingScreenController {
  @override
  void goToSignIn() {
    Get.toNamed("/signin");
  }

  @override
  void goToSignUp() {
    Get.toNamed("/signup");
  }
}
