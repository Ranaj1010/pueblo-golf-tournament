import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pueblo_golf_tournament_mobile/api/registration/registration-controller.dart';
import 'package:pueblo_golf_tournament_mobile/screens/sign-up-screen/interface.dart';
import 'package:pueblo_golf_tournament_mobile/screens/sign-up-screen/widgets.dart';

import '../../dto/model/person-dto.dart';
import '../../dto/request/register-account-request-dto.dart';
import '../../dto/request/register-person-request-dto.dart';

class SignUpScreenController extends ISignUpScreenController {
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
  final personalInfoFormKey = GlobalKey<FormState>();
  final contactFormKey = GlobalKey<FormState>();
  final accountFormKey = GlobalKey<FormState>();
  @override
  void onInit() {
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
  void peekConfirmPassword() {
    isConfirmPasswordPeeked(!isConfirmPasswordPeeked.value);
  }

  @override
  void peekPassword() {
    isPasswordPeeked(!isPasswordPeeked.value);
  }

  @override
  void previous() {
    selectedFormIndex(--selectedFormIndex.value);
  }

  @override
  void signInNow() {
    selectedFormIndex(0);
    Get.offNamed("/signin");
  }

  @override
  void signUp() async {
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
      var response = await registrationController.registerAccount(
          ReqisterAccountRequesDto(account: account, person: person));

      if (response.data!.person == null) {
        Get.snackbar("Sign Up Failed", response.message);
      }

      if (response.data!.person != null) {
        selectedFormIndex(++selectedFormIndex.value);
      }

      isLoading(false);
    }
  }
}
