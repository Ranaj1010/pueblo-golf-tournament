import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:pueblo_golf_tournament_mobile/api/dtos/person-dto.dart';
import 'package:pueblo_golf_tournament_mobile/api/dtos/player-dto.dart';
import 'package:pueblo_golf_tournament_mobile/api/requests/registration/register-account-dto.dart';
import 'package:pueblo_golf_tournament_mobile/api/service/registration-controller.dart';
import 'package:pueblo_golf_tournament_mobile/models/person.dart';
import 'package:pueblo_golf_tournament_mobile/utilities/enums.dart';

class RegistrationScreenController extends GetxController {
  var firstNameTextController = TextEditingController();
  var middleNameTextController = TextEditingController();
  var lastNameTextController = TextEditingController();
  var birthDateTextController = TextEditingController();
  var contactTextController = TextEditingController();
  var emailAddressTextController = TextEditingController();
  var usernameTextController = TextEditingController();
  var passwordTextController = TextEditingController();
  var confirmPasswordTextController = TextEditingController();
  var whsIdController = TextEditingController();
  var homeClubTextController = TextEditingController();
  var handicapTextController = TextEditingController();
  var peekPassword = false.obs;
  var peekConfirmPassword = false.obs;
  var isReady = false.obs;
  final registrationController = Get.find<RegistrationController>();

  var isRegistering = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    firstNameTextController.addListener(enableRegisterButton);
    lastNameTextController.addListener(enableRegisterButton);
    birthDateTextController.addListener(enableRegisterButton);
    contactTextController.addListener(enableRegisterButton);
    emailAddressTextController.addListener(enableRegisterButton);
    usernameTextController.addListener(enableRegisterButton);
    passwordTextController.addListener(enableRegisterButton);
    confirmPasswordTextController.addListener(enableRegisterButton);
    whsIdController.addListener(enableRegisterButton);
    handicapTextController.addListener(enableRegisterButton);
  }

  void togglePeek() {
    peekPassword(!peekPassword.value);
  }

  void togglePeekConfirmPassword() {
    peekConfirmPassword(!peekConfirmPassword.value);
  }

  enableRegisterButton() {
    isReady(firstNameTextController.text.isNotEmpty &&
        lastNameTextController.text.isNotEmpty &&
        birthDateTextController.text.isNotEmpty &&
        contactTextController.text.isNotEmpty &&
        emailAddressTextController.text.isNotEmpty &&
        whsIdController.text.isNotEmpty &&
        handicapTextController.text.isNotEmpty &&
        usernameTextController.text.isNotEmpty &&
        passwordTextController.text.isNotEmpty &&
        confirmPasswordTextController.text.isNotEmpty);
  }

  void register() async {
    isRegistering(true);
    var person = PersonDto(
      firstName: firstNameTextController.text,
      middleName: middleNameTextController.text,
      lastName: lastNameTextController.text,
      birthDate: DateFormat("MMMM dd, yyyy")
          .parse(birthDateTextController.text)
          .toUtc(),
      contactNumber: contactTextController.text,
      emailAddress: emailAddressTextController.text,
      country: "Philippines",
      id: 0,
    );

    var account = AccountRawDto(
        username: usernameTextController.text,
        password: passwordTextController.text);

    var playerDetails = PlayerDto(
        id: 0,
        playerType: PlayerTypeEnum.Captain.index,
        handicap: double.parse(handicapTextController.text),
        homeClub: homeClubTextController.text,
        worldHandicapSystemId: whsIdController.text);
    var response = await registrationController.registerAccount(
        RegisterAccountDto(
            person: person, account: account, player: playerDetails));

    if (response.data != null) {
      Get.toNamed("/registration-success");
    }
    if (response.data == null) {
      Get.snackbar("Failed", "Failed to register account");
    }
    isRegistering(false);
  }
}
