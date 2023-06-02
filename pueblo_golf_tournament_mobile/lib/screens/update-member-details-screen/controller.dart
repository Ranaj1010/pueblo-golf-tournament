import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pueblo_golf_tournament_mobile/api/manage/manage-controller.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/person-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/player-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/update-person-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/update-player-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/screens/update-member-details-screen/interface.dart';
import 'package:pueblo_golf_tournament_mobile/screens/update-member-details-screen/widgets.dart';

import '../../api/registration/registration-controller.dart';
import '../../data/context.dart';
import '../../dto/response/lookup-tournament-team-response-dto.dart';
import '../add-team-member-screen/controller.dart';
import '../registered-team-details-screen/controller.dart';

class UpdateMemberDetailsScreenController
    extends IUpdateMemberDetailScreenController {
  var hasWHSId = false.obs;
  var playerProfile = Rxn<PlayerProfile>();
  var isPasswordPeeked = false.obs;
  var isConfirmPasswordPeeked = false.obs;
  var isLoading = false.obs;
  var selectedFormIndex = 0.obs;
  var selectedProfile = Rxn<PlayerProfile>();
  var forms = [];
  var formTitles = ["Personal", "Contact", "Player", "Congratulations"];
  var firstNameTextController = TextEditingController();
  var middleNameTextController = TextEditingController();
  var lastNameTextController = TextEditingController();
  var birthDateTextController = TextEditingController();
  var mobileNumberTextController = TextEditingController();
  var emailAddressTextController = TextEditingController();
  var homeAddressTextController = TextEditingController();
  var cityTextController = TextEditingController();
  var countryTextController = TextEditingController();
  var homeClubTextController = TextEditingController();
  var worldHandicapSystemIdTextController = TextEditingController();
  final addTeamMemberScreenController =
      Get.find<AddTeamMemberScreenController>();
  final registrationController = Get.find<RegistrationController>();
  final dataContextController = Get.find<DataContextController>();
  final registeredTeamScreenController =
      Get.find<RegisteredTeamDetailsScreenController>();
  final manageController = Get.find<ManageController>();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    forms = [
      PersonalInfoForm(
          firstNameTextController: firstNameTextController,
          middleNameTextController: middleNameTextController,
          lastNameTextController: lastNameTextController,
          birthDateTextController: birthDateTextController),
      ContactForm(
          mobileNumberTextController: mobileNumberTextController,
          emailAddressTextController: emailAddressTextController,
          homeAddressTextController: homeAddressTextController,
          cityTextController: cityTextController,
          countryTextController: countryTextController),
      PlayerForm(
        homeClubTextController: homeClubTextController,
        worldHandicapSystemIdTextController:
            worldHandicapSystemIdTextController,
      ),
      SignUpSuccess()
    ];
  }

  @override
  void goBack() {
    Get.back(result: selectedProfile.value);
  }

  @override
  void next() {
    selectedFormIndex(++selectedFormIndex.value);
  }

  @override
  void previous() {
    selectedFormIndex(--selectedFormIndex.value);
  }

  @override
  void updatePlayerProfile() async {
    isLoading(true);
    try {
      var person = PersonDto(
          id: selectedProfile.value!.person.id,
          firstName: firstNameTextController.text,
          middleName: middleNameTextController.text,
          lastName: lastNameTextController.text,
          birthDate: DateFormat("MMMM dd, yyyy")
              .parse(birthDateTextController.text)
              .toUtc()
              .add(const Duration(days: 1)),
          homeAddress: homeAddressTextController.text,
          city: cityTextController.text,
          contactNumber: mobileNumberTextController.text,
          emailAddress: emailAddressTextController.text,
          country: countryTextController.text);
      print(jsonEncode(person));
      var player = PlayerDto(
          id: selectedProfile.value!.player.id,
          playerType: selectedProfile.value!.player.playerType,
          worldHandicapSystemId: worldHandicapSystemIdTextController.text,
          playerExternalId: selectedProfile.value!.player.playerExternalId,
          handicap: selectedProfile.value!.player.handicap,
          homeClub: homeClubTextController.text,
          personId: selectedProfile.value!.player.personId,
          person: selectedProfile.value!.person);

      var updatedPerson = await manageController
          .updatePerson(UpdatePersonRequestDto(person: person));

      if (updatedPerson.data != null) {
        var updatedPlayer = await manageController
            .updatePlayer(UpdatePlayerRequestDto(player: player));

        if (updatedPlayer.data != null) {
          selectedFormIndex(++selectedFormIndex.value);
          selectedProfile(PlayerProfile(
              person: updatedPerson.data!, player: updatedPlayer.data!));
          Get.snackbar("Success", "Member details updated.");
        }
      }

      isLoading(false);
    } catch (e) {
      print(e);
      isLoading(false);
      Get.snackbar("Update Failed", "Something went wrong. Please try again.");
    }
  }

  @override
  void loadProfile(PlayerProfile profile) {
    selectedProfile(profile);
    selectedFormIndex(0);
    firstNameTextController.text = profile.person.firstName;
    middleNameTextController.text = profile.person.middleName;
    lastNameTextController.text = profile.person.lastName;
    birthDateTextController.text =
        DateFormat("MMMM dd, yyyy").format(profile.person.birthDate);
    mobileNumberTextController.text = profile.person.contactNumber;
    emailAddressTextController.text = profile.person.emailAddress;
    homeAddressTextController.text = profile.person.homeAddress;
    cityTextController.text = profile.person.city;
    countryTextController.text = profile.person.country;
    homeClubTextController.text = profile.player.homeClub;
    worldHandicapSystemIdTextController.text =
        profile.player.worldHandicapSystemId;
  }
}
