import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pueblo_golf_tournament_mobile/api/dtos/payment-dto.dart';
import 'package:pueblo_golf_tournament_mobile/api/dtos/team-dto.dart';
import 'package:pueblo_golf_tournament_mobile/api/requests/registration/register-team-dto.dart';
import 'package:pueblo_golf_tournament_mobile/api/service/authentication-controller.dart';
import 'package:pueblo_golf_tournament_mobile/api/service/registration-controller.dart';
import 'package:pueblo_golf_tournament_mobile/controllers/screens/tournament-details-screen-controller.dart';

class RegisterTeamScreenController extends GetxController {
  var paymentImage = Rxn<File>();
  var logoImage = Rxn<File>();
  var teamTextController = TextEditingController();
  var paymentMethodTextController = TextEditingController();
  var referrenceIdTextController = TextEditingController();
  var isRegistering = false.obs;
  var isReady = false.obs;
  final registrationController = Get.find<RegistrationController>();
  final tournamentDetailsController =
      Get.find<TournamentDetailsScreenController>();
  final authenticationController = Get.find<AuthenticationController>();
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    teamTextController.addListener(enableRegisterButton);
    paymentMethodTextController.addListener(enableRegisterButton);
    referrenceIdTextController.addListener(enableRegisterButton);
  }

  var members = <TeamMemberRawDto>[].obs;

  void addMember(TeamMemberRawDto memberRawDto) {
    members.add(memberRawDto);
  }

  void goToAddMember() {
    Get.toNamed("/registration-add-member");
  }

  enableRegisterButton() {
    isReady(teamTextController.text.isNotEmpty &&
        paymentMethodTextController.text.isNotEmpty &&
        referrenceIdTextController.text.isNotEmpty &&
        paymentImage.value != null &&
        logoImage.value != null);
  }

  Future getPaymentScrenshot() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    }

    final imageTemp = File(image.path);
    paymentImage(imageTemp);
    enableRegisterButton();
    update();
  }

  Future getTeamLogo() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    }

    final imageTemp = File(image.path);
    logoImage(imageTemp);
    enableRegisterButton();
    update();
  }

  void registerTeam() async {
    isRegistering(true);
    var team = TeamRawDto(name: teamTextController.text, logoUrl: "");
    var teamCaptain = TeamCaptainRawDto(
        personId: authenticationController
            .authenticatedUserData.value!.personalDetails!.id,
        playerDetails: authenticationController
            .authenticatedUserData.value!.playerDetails!);
    var payment = PaymentDto(
        id: 1,
        paymentMethod: paymentMethodTextController.text,
        referrenceId: referrenceIdTextController.text,
        paymentDate: DateTime.now().toUtc());
    var response = await registrationController.registerTeam(RegisterTeamDto(
        team: team,
        teamCaptain: teamCaptain,
        members: members,
        payment: payment,
        tournamentId:
            tournamentDetailsController.selectedTournament.value!.id.toInt(),
        divisionId:
            tournamentDetailsController.selectedDivision.value!.id.toInt()));
    isRegistering(false);
    if (response.data != null) {
      //GO TO SUCCESS

      print(jsonEncode(response.data));

      var imagesUpload = await registrationController.registerTeamImages(
          response.data!.registration.teamId,
          paymentImage.value!,
          logoImage.value!);

      if (imagesUpload) {
        Get.offNamed("/registration-team-success");
      }
    }
  }
}
