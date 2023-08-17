import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/register-scorer-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/screens/add-tournament-scorer-screen/interface.dart';
import 'package:pueblo_golf_tournament_mobile/screens/tournament-details-screen/controller.dart';

import '../../api/registration/registration-controller.dart';
import '../../dto/request/register-account-request-dto.dart';
import '../../dto/request/register-person-request-dto.dart';
import '../../dto/request/register-tournament-scorer-request-dto.dart';
import 'widgets.dart';

class AddTournamentScorerScreenController
    extends IAddTournamentScorerScreenController {
  var isPasswordPeeked = false.obs;
  var isConfirmPasswordPeeked = false.obs;
  var isLoading = false.obs;
  var disableNext = true.obs;
  var selectedFormIndex = 0.obs;
  var forms = [];
  var formTitles = ["Personal", "Contact", "Account", "Congratulations"];
  var firstNameTextController = TextEditingController();
  var middleNameTextController = TextEditingController();
  var lastNameTextController = TextEditingController();
  var birthDateTextController = TextEditingController();
  var mobileNumberTextController = TextEditingController();
  var emailAddressTextController = TextEditingController();
  var homeAddressTextController = TextEditingController();
  var cityTextController = TextEditingController();
  var countryTextController = TextEditingController();
  var usernameTextController = TextEditingController();
  var passwordTextController = TextEditingController();
  var confirmPasswordTextController = TextEditingController();
  final registrationController = Get.find<RegistrationController>();
  final tournamentDetailsScreenController =
      Get.find<TournamentDetailsScreenController>();
  final personalInfoFormKey = GlobalKey<FormState>();
  final contactFormKey = GlobalKey<FormState>();
  final accountFormKey = GlobalKey<FormState>();

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
      Obx(
        () => AccountForm(
          formKey: accountFormKey,
          usernameTextController: usernameTextController,
          passwordTextController: passwordTextController,
          confirmPasswordTextController: confirmPasswordTextController,
          isConfirmPasswordPeeked: isConfirmPasswordPeeked.value,
          isPasswordPeeked: isPasswordPeeked.value,
          peekPassword: () => peekPassword(),
          peekConfirmPassword: () => peekConfirmPassword(),
        ),
      ),
      SignUpSuccess()
    ];
  }

  @override
  void loadAccounInformationForm() {
    // TODO: implement loadAccounInformationForm
  }

  @override
  void peekConfirmPassword() {
    isConfirmPasswordPeeked(!isConfirmPasswordPeeked.value);
  }

  @override
  void peekPassword() {
    isPasswordPeeked(!isPasswordPeeked.value);
  }

  @override
  void registerScorer() async {
    if (accountFormKey.currentState!.validate()) {
      isLoading(true);
      var person = ReqisterPersonRequesDto(
        firstName: firstNameTextController.text,
        middleName: middleNameTextController.text,
        lastName: lastNameTextController.text,
        birthDate: DateFormat("MMMM dd, yyyy")
            .parse(birthDateTextController.text)
            .toUtc(),
        homeAddress: homeAddressTextController.text,
        city: cityTextController.text,
        contactNumber: mobileNumberTextController.text,
        emailAddress: emailAddressTextController.text,
        country: countryTextController.text,
      );

      var account = RegisterAccountCredentialDto(
          username: usernameTextController.text,
          password: passwordTextController.text);
      var response = await registrationController.registerScorer(
          RegisterScorerRequestDto(account: account, person: person));
      print(response.message);
      if (response.data == null) {
        Get.snackbar("Registrartion Failed", response.message);
      }

      if (response.data != null) {
        var registeredTournamentScorer = await registrationController
            .registerTournamentScorer(ReqisterTournamentScorerRequestDto(
                scorerId: response.data!.scorer!.id,
                tournamentId: tournamentDetailsScreenController
                    .selectedTournament.value!.id));

        if (registeredTournamentScorer.success) {
          selectedFormIndex(++selectedFormIndex.value);
        }
      }

      isLoading(false);
    }
  }

  @override
  void back() {
    Get.back();
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

  @override
  void initialize() {
    selectedFormIndex(0);
    firstNameTextController.clear();
    middleNameTextController.clear();
    lastNameTextController.clear();
    birthDateTextController.clear();
    mobileNumberTextController.clear();
    emailAddressTextController.clear();
    cityTextController.clear();
    countryTextController.clear();
    usernameTextController.clear();
    passwordTextController.clear();
    confirmPasswordTextController.clear();
  }
}
