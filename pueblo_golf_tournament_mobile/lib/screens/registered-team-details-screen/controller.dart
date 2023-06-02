import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:pueblo_golf_tournament_mobile/api/lookup/lookup-controller.dart';
import 'package:pueblo_golf_tournament_mobile/api/manage/manage-controller.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/confirm-payment-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-tournament-team-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/screens/pay-registration-screen/controller.dart';
import 'package:pueblo_golf_tournament_mobile/screens/tournament-details-screen/controller.dart';
import 'package:pueblo_golf_tournament_mobile/screens/view-team-member-screen/controller.dart';

import '../../dto/request/lookup-tournament-team-request-dto.dart';
import 'interface.dart';

class RegisteredTeamDetailsScreenController
    extends IRegisteredTeamDetailsScreenControler {
  var isConfirming = false.obs;
  var registeredTeam = Rxn<RegisteredTeam>();
  var selectedMember = Rxn<PlayerProfile>();
  final lookupController = Get.find<LookupController>();
  final manageController = Get.find<ManageController>();

  @override
  void goBack() {
    Get.back();
  }

  @override
  void selectedRegisteredTeam(RegisteredTeam team) {
    registeredTeam(team);
    loadTeamRegistration();
  }

  @override
  void uploadRegistrationPayment() {
    // TODO: implement uploadRegistrationPayment
  }

  @override
  void updateTeamDetails() {
    // TODO: implement updateTeamDetails
  }

  @override
  void viewMemberDetails(PlayerProfile playerProfile) {
    selectedMember(playerProfile);
    var updatedMember = Get.toNamed("/member-details");
  }

  @override
  void payRegistration() {
    var payment = Get.toNamed("/pay-registration");
    if (payment != null) {}
  }

  @override
  void loadTeamRegistration() async {
    var response = await lookupController.lookupTournamentTeam(
        LookupTournamentTeamRequestDto(
            tournamentId: registeredTeam.value!.registration.tournamentId,
            teamCaptainId: registeredTeam.value!.captainProfile.player.id));
    if (response.registeredTeams.isNotEmpty) {
      registeredTeam(response.registeredTeams.first);
    }
  }

  @override
  void confirmRegistrationPayment() async {
    isConfirming(true);
    try {
      var confirmPayment = await manageController.confirmPayment(
          ConfirmPaymentRequestDto(
              registrationId: registeredTeam.value!.registration.id));

      if (confirmPayment.payment != null) {
        loadTeamRegistration();
        Get.snackbar("Registration Confirmed",
            "This team is now registered for the tournament.");
      }
    } catch (e) {
      print(e);
      Get.snackbar("Failed to confirm registration",
          "Something went wrong. Please try again.");
    }
    isConfirming(false);
  }
}
