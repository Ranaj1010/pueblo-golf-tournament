import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pueblo_golf_tournament_mobile/api/registration/registration-controller.dart';
import 'package:pueblo_golf_tournament_mobile/api/upload/upload-controller.dart';
import 'package:pueblo_golf_tournament_mobile/data/context.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/person-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/player-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/register-payment-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/register-team-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/upload-mobile-proof-of-payment-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/upload-mobile-team-logo-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-tournament-team-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/screens/register-team-screen/widgets.dart';
import 'package:pueblo_golf_tournament_mobile/screens/tournament-details-screen/controller.dart';
import 'package:pueblo_golf_tournament_mobile/utilities/enums.dart';

import '../../dto/response/register-team-response-dto.dart';
import 'interface.dart';

class RegisterTeamScreenController extends IRegisterTeamScreenController {
  var selectedFormIndex = 0.obs;
  var isLoading = false.obs;
  var disabledNext = true.obs;
  var isConfirmationUnderstood = false.obs;
  var members = <PlayerProfile>[].obs;
  var selectedPaymentMethod = PaymentMethodEnum.GCash.obs;
  var paymentReferrenceIdTextController = TextEditingController();
  final dataContextController = Get.find<DataContextController>();
  final tournamentDetailsController =
      Get.find<TournamentDetailsScreenController>();

  final registrationController = Get.find<RegistrationController>();
  final uploadController = Get.find<UploadController>();
  var forms = [];
  var registeredTeamData = Rxn<RegisterTeamDataDto>();
  var teamNameTextController = TextEditingController();

  var formTitles = [
    "Create your Team",
    "Add your Members",
    "Confirm Registration",
    "Congratulations"
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    teamNameTextController.addListener(() => disabledNextWhen());
    paymentReferrenceIdTextController.addListener(() => disabledNextWhen());
    forms = [
      TeamForm(
        teamNameTextController: teamNameTextController,
      ),
      Obx(
        () => AddMembersForm(
          onAddMember: () => addMember(),
          members: members.value,
        ),
      ),
      Obx(
        () => ConfirmationForm(
          members: members.value,
          isUnderstood: isConfirmationUnderstood.value,
          onTapUnderstand: (bool value) {
            isConfirmationUnderstood(value);
            disabledNextWhen();
          },
          teamName: teamNameTextController.text,
        ),
      ),
      TeamRegistrationSuccess()
    ];
  }

  @override
  void next() {
    selectedFormIndex(++selectedFormIndex.value);
    disabledNextWhen();
  }

  @override
  void previous() {
    selectedFormIndex(--selectedFormIndex.value);
    disabledNextWhen();
  }

  @override
  void addMember() async {
    var addedMember = await Get.toNamed("/register-player");
    if (addedMember != null) {
      print(jsonEncode(addedMember));

      var profile = PlayerProfile.fromJson(jsonDecode(jsonEncode(addedMember)));
      members.add(profile);
      Get.snackbar("Member added",
          "${profile.person.firstName} ${profile.person.lastName} is now added to the team.");
      disabledNextWhen();
      update();
    }
  }

  @override
  void goBackToHome() {
    selectedFormIndex(0);
    Get.back();
  }

  @override
  void registerTeam() async {
    isLoading(true);

    var team = RegisterTeamRequestDto(
        backgroundColor: Random().nextInt(Colors.primaries.length).toString(),
        name: teamNameTextController.text,
        members: members.map((element) => element.player.id).toList(),
        teamCaptainId: dataContextController.playerProfile.value!.player.id,
        tournamentId: tournamentDetailsController.selectedTournament.value!.id);

    var registeredTeam = await registrationController.registerTeam(team);

    if (registeredTeam.data != null) {
      registeredTeamData(registeredTeam.data);
      selectedFormIndex(++selectedFormIndex.value);
    }

    isLoading(false);
  }

  @override
  void addMemberToTeam(PlayerProfile profile) {
    members.add(profile);
    members.refresh();
  }

  @override
  void resetForm() {
    selectedFormIndex(0);
    Get.back(result: registeredTeamData);
  }

  @override
  void disabledNextWhen() {
    switch (selectedFormIndex.value) {
      case 0:
        disabledNext(teamNameTextController.value.text.isEmpty);
        break;

      case 1:
        disabledNext(members.length != 4);
        break;
      case 2:
        disabledNext(!isConfirmationUnderstood.value);
        break;
      default:
    }
  }
}
