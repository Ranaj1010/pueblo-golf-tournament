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

  final registrationController = Get.find<RegistrationController>();
  final tournamentDetailsController =
      Get.find<TournamentDetailsScreenController>();
  final authenticationController = Get.find<AuthenticationController>();
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
  }

  var members = <TeamMemberRawDto>[].obs;

  void addMember(TeamMemberRawDto memberRawDto) {
    members.add(memberRawDto);
  }

  void goToAddMember() {
    Get.toNamed("/registration-add-member");
  }

  Future getPaymentScrenshot() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    }

    final imageTemp = File(image.path);
    paymentImage(imageTemp);

    update();
  }

  Future getTeamLogo() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    }

    final imageTemp = File(image.path);
    logoImage(imageTemp);

    update();
  }

  void registerTeam() async {
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

    if (response.data != null) {
      //GO TO SUCCESS

      var imagesUpload = await registrationController.registerTeamImages(
          response.data!.team.id, paymentImage.value!, logoImage.value!);

      if (imagesUpload) {
        Get.offNamed("/registration-team-success");
      }
    }
  }
}
