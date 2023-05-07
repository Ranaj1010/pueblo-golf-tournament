import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';
import 'package:pueblo_golf_tournament_mobile/controllers/registration-controller.dart';
import 'package:pueblo_golf_tournament_mobile/dtos/outgoing/register-account-dto.dart';

import '../widgets/common-widgets.dart';

class AccountRegistrationScreen extends StatefulWidget {
  const AccountRegistrationScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AccountRegistrationScreenState();
  }
}

class AccountRegistrationScreenState extends State<AccountRegistrationScreen> {
  FocusNode initialFocusNode = FocusNode();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool peekPassword = false;
  bool peekConfirmPassword = false;

  final registrationController = Get.find<RegistrationController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 500)).then((value) {
      setState(() {
        initialFocusNode.requestFocus();
        firstNameController.text = "John";
        middleNameController.text = "Smith";
        lastNameController.text = "Smith";
        emailAddressController.text = "johndoe@gmail.com";
        contactNumberController.text = "09453929961";
        usernameController.text = "johnDoe123";
        passwordController.text = "johnDoe123!";
        confirmPasswordController.text = "johnDoe123!";
      });
    });
  }

  void onHandlePeekPassword() {
    setState(() {
      peekPassword = !peekPassword;
    });
  }

  void onHandlePeekConfirmPassword() {
    setState(() {
      peekConfirmPassword = !peekConfirmPassword;
    });
  }

  void onHandleSignUp() {
    var account = AccountRawDto(
        username: usernameController.text, password: passwordController.text);
    var person = PersonRawDto(
        firstName: firstNameController.text,
        middleName: middleNameController.text,
        lastName: lastNameController.text,
        birthDate: DateFormat("MMMM dd, yyyy").parse(birthDateController.text),
        contactNumber: contactNumberController.text,
        emailAddress: emailAddressController.text,
        country: "Philippines");
    registrationController.registerAccount(
        RegisterAccountDto(account: account.toJson(), person: person.toJson()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(""),
        backgroundColor: Colors.white,
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Sign Up',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              ),
              BrandTextField(
                focusNode: initialFocusNode,
                hintText: "First Name",
                controller: firstNameController,
                labelText: "First Name",
                textInputType: TextInputType.name,
              ),
              const Padding(padding: EdgeInsets.all(5)),
              BrandTextField(
                hintText: "Middle Name",
                controller: middleNameController,
                labelText: "Middle Name",
                textInputType: TextInputType.name,
              ),
              const Padding(padding: EdgeInsets.all(5)),
              BrandTextField(
                hintText: "Last Name",
                controller: lastNameController,
                labelText: "Last Name",
                textInputType: TextInputType.name,
              ),
              const Padding(padding: EdgeInsets.all(5)),
              BrandDateTimePicker(
                hintText: 'Birth Date',
                labelText: 'Birth Date',
                controller: birthDateController,
              ),
              const Padding(padding: EdgeInsets.all(5)),
              BrandTextField(
                hintText: "Email Address",
                controller: emailAddressController,
                labelText: "Email Address",
                textInputType: TextInputType.emailAddress,
              ),
              const Padding(padding: EdgeInsets.all(5)),
              BrandTextField(
                hintText: "Contact Number",
                controller: contactNumberController,
                labelText: "Contact Number",
                textInputType: TextInputType.number,
              ),
              const Padding(padding: EdgeInsets.all(5)),
              BrandTextField(
                hintText: "Username",
                controller: usernameController,
                labelText: "Username",
                textInputType: TextInputType.name,
              ),
              const Padding(padding: EdgeInsets.all(5)),
              BrandTextField(
                  hintText: "Password",
                  controller: passwordController,
                  labelText: "Password",
                  textInputType: TextInputType.visiblePassword,
                  obscureText: !peekPassword,
                  trailButton: IconButton(
                      icon: Icon(!peekPassword
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () => onHandlePeekPassword())),
              const Padding(padding: EdgeInsets.all(5)),
              BrandTextField(
                  hintText: "Confirm Password",
                  controller: confirmPasswordController,
                  labelText: "Confirm Password",
                  textInputType: TextInputType.visiblePassword,
                  obscureText: !peekConfirmPassword,
                  trailButton: IconButton(
                      icon: Icon(!peekConfirmPassword
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () => onHandlePeekConfirmPassword())),
              const Padding(padding: EdgeInsets.all(20)),
              BrandElevatedButton(
                onPressed: onHandleSignUp,
                child: registrationController.loadingRegistration.value
                    ? CircularProgressIndicator()
                    : const Text("Sign Up"),
                isFluid: true,
              ),
              const Padding(padding: EdgeInsets.all(30)),
            ]),
          ),
        ),
      ),
    );
  }
}
