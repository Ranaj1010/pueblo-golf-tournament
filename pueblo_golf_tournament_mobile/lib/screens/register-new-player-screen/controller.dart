import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pueblo_golf_tournament_mobile/api/registration/registration-controller.dart';
import 'package:pueblo_golf_tournament_mobile/data/context.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/register-person-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-tournament-team-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/screens/add-team-member-screen/controller.dart';
import 'package:pueblo_golf_tournament_mobile/screens/register-team-screen/controller.dart';

import '../../dto/request/register-player-request-dto.dart';
import 'interface.dart';
import 'widgets.dart';

class RegisterNewPlayerScreenController
    extends IRegisterNewPlayerScreenController {
  var hasWHSId = false.obs;
  var playerProfile = Rxn<PlayerProfile>();
  var isPasswordPeeked = false.obs;
  var isConfirmPasswordPeeked = false.obs;
  var isMemberAlreadyExists = false.obs;
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
  final registerTeamScreenController = Get.find<RegisterTeamScreenController>();
  final personalInfoFormKey = GlobalKey<FormState>();
  final contactFormKey = GlobalKey<FormState>();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    forms = [
      PersonalInfoForm(
          formKey: personalInfoFormKey,
          firstNameTextController: firstNameTextController,
          middleNameTextController: middleNameTextController,
          lastNameTextController: lastNameTextController,
          birthDateTextController: birthDateTextController),
      ContactForm(
          formKey: contactFormKey,
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
      homeAddress: homeAddressTextController.text,
      city: cityTextController.text,
      country: countryTextController.text,
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
        Get.snackbar(
            "Registration Failed.", "${response.message}. Please try again");
      }

      if (response.playerProfile != null) {
        var existingMember = registerTeamScreenController.members.where(
            (element) =>
                element.player.playerExternalId ==
                response.playerProfile!.player.playerExternalId);

        if (existingMember.isNotEmpty) {
          isMemberAlreadyExists(true);
          Get.snackbar("Member already exists.",
              "Please add another member for this team.");
        }

        if (existingMember.isEmpty) {
          selectedFormIndex(0);
          isMemberAlreadyExists(false);
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

          Get.back(result: response.playerProfile);
        }
      }
    }

    isLoading(false);
  }

  @override
  void next() {
    switch (selectedFormIndex.value) {
      case 0:
        if (personalInfoFormKey.currentState!.validate()) {
          selectedFormIndex(++selectedFormIndex.value);
        }
        break;
      case 1:
        if (contactFormKey.currentState!.validate()) {
          selectedFormIndex(++selectedFormIndex.value);
        }
        break;
      default:
    }
  }

  @override
  void previous() {
    selectedFormIndex(--selectedFormIndex.value);
  }
}
