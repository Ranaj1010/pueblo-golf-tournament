import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:pueblo_golf_tournament_mobile/controllers/screens/tournament-details-screen-controller.dart';

class RegistrationSuccessScreenController extends GetxController {
  final tournamentDetailsController =
      Get.find<TournamentDetailsScreenController>();
  void goBackToLanding() {
    tournamentDetailsController.loadRegistration();
    Get.offAllNamed("/");
  }
}
