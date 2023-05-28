import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pueblo_golf_tournament_mobile/api/registration/registration-controller.dart';
import 'package:pueblo_golf_tournament_mobile/data/context.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/register-person-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-tournament-team-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/screens/add-team-member-screen/controller.dart';

import '../../dto/request/register-player-request-dto.dart';
import 'interface.dart';
import 'widgets.dart';

class RegisterNewPlayerScreenController
    extends IRegisterNewPlayerScreenController {
  var hasWHSId = false.obs;
  var playerProfile = Rxn<PlayerProfile>();
  var isPasswordPeeked = false.obs;
  var isConfirmPasswordPeeked = false.obs;
  var isLoading = false.obs;
  var selectedFormIndex = 0.obs;
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
  void registerPlayerProfile() async {
    isLoading(true);
    var person = ReqisterPersonRequesDto(
      firstName: firstNameTextController.text,
      middleName: middleNameTextController.text,
      lastName: lastNameTextController.text,
      birthDate: DateFormat("MMMM dd, yyyy")
          .parse(birthDateTextController.text)
          .toUtc(),
      contactNumber: mobileNumberTextController.text,
      emailAddress: emailAddressTextController.text,
      country: "Philippines",
    );
    var registeredPerson = await registrationController.registerPerson(person);

    if (registeredPerson.data == null) {
      Get.snackbar("Registration Failed.", "Please try again");
    }

    if (registeredPerson.data != null) {
      var response = await registrationController.registerPlayer(
          RegisterPlayerRequestDto(
              worldHandicapSystemId: worldHandicapSystemIdTextController.text,
              homeClub: homeClubTextController.text,
              personId: registeredPerson.data!.id));

      if (response.playerProfile == null) {
        Get.snackbar("Registration Failed.", "Please try again");
      }

      if (response.playerProfile != null) {
        addTeamMemberScreenController.autoEncodeCreatedPlayer(
            response.playerProfile!.player.playerExternalId);
        selectedFormIndex(++selectedFormIndex.value);
      }
    }

    isLoading(false);
  }

  @override
  void iHaveWHSId() {
    hasWHSId(!hasWHSId.value);
  }

  @override
  void goBack() {
    firstNameTextController.clear();
    middleNameTextController.clear();
    lastNameTextController.clear();
    birthDateTextController.clear();
    mobileNumberTextController.clear();
    emailAddressTextController.clear();
    homeAddressTextController.clear();
    cityTextController.clear();
    countryTextController.clear();
    homeClubTextController.clear();
    worldHandicapSystemIdTextController.clear();
    selectedFormIndex(0);
    Get.back();
  }

  @override
  void next() {
    selectedFormIndex(++selectedFormIndex.value);
  }

  @override
  void previous() {
    selectedFormIndex(--selectedFormIndex.value);
  }
}
