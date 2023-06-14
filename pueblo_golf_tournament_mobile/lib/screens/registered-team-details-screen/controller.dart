import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:pueblo_golf_tournament_mobile/api/lookup/lookup-controller.dart';
import 'package:pueblo_golf_tournament_mobile/api/manage/manage-controller.dart';
import 'package:pueblo_golf_tournament_mobile/api/registration/registration-controller.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/confirm-payment-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/register-tournament-player-request-dto.dart';
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
  final registrationController = Get.find<RegistrationController>();
  var baseUrl = "";

  RegisteredTeamDetailsScreenController() {
    baseUrl =
        "http://${FlavorConfig.instance.variables["baseUrl"] ?? dotenv.env["BASE_URL"]}";
  }

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

  @override
  void previewPaymentImage() {
    print(registeredTeam.value!.payment!.paymentReferrencePhoto);
    Get.defaultDialog(
        title: "Preview",
        content: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.network(
              baseUrl + registeredTeam.value!.payment!.paymentReferrencePhoto,
              errorBuilder: (context, exception, stacktrace) => Container(
                  height: 500,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 230, 230, 230)),
                  child: const Center(
                      child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    direction: Axis.vertical,
                    alignment: WrapAlignment.center,
                    runAlignment: WrapAlignment.center,
                    children: [
                      Icon(Icons.image_not_supported_outlined, size: 20),
                      Text("Image not found."),
                    ],
                  )))),
        ));
  }

  @override
  void addMember() async {
    var addedMember = await Get.toNamed("/register-player");
    if (addedMember != null) {
      print(jsonEncode(addedMember));

      var profile = PlayerProfile.fromJson(jsonDecode(jsonEncode(addedMember)));

      var addedPlayer = await registrationController.registerTournamentPlayer(
          RegisterTournamentPlayerRequestDto(
              registrationId: registeredTeam.value!.registration.id,
              teamId: registeredTeam.value!.registration.teamId,
              tournamentId: registeredTeam.value!.registration.tournamentId,
              playerId: profile.player.id));

      loadTeamRegistration();
      Get.snackbar("Member added",
          "${profile.person.firstName} ${profile.person.lastName} is now added to the team.");
      update();
    }
  }
}
