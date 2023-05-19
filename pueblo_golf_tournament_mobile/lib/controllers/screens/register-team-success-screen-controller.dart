import 'package:get/get.dart';

class RegistrationTeamSuccessScreenController extends GetxController {
  void goBackToTournamentDetails() {
    Get.offNamed("/tournament-details");
  }
}
