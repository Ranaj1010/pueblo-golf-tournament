import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pueblo_golf_tournament_mobile/api/authentication/authentication-controller.dart';
import 'package:pueblo_golf_tournament_mobile/data/context.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/authenticate-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/screens/home-screen/controller.dart';
import 'package:pueblo_golf_tournament_mobile/screens/sign-in-screen/interface.dart';

class SignInScreenController extends ISignInScreenController {
  var isPeeked = false.obs;
  var isLoading = false.obs;
  var isKeptSignedIn = false.obs;
  var isFailedToLogin = false.obs;
  var isUserNameEmpty = true.obs;
  var isPasswordEmpty = true.obs;
  var usernameTextController = TextEditingController();
  var passwordTextController = TextEditingController();
  final homeScreenController = Get.find<HomeScreenController>();
  final authenticationController = Get.find<AuthenticateController>();
  final dataContextController = Get.find<DataContextController>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    usernameTextController.addListener(() {
      isUserNameEmpty(usernameTextController.text.isEmpty);
    });

    passwordTextController.addListener(() {
      isPasswordEmpty(passwordTextController.text.isEmpty);
    });
  }

  @override
  void forgotPassword() {
    // TODO: implement forgotPassword
  }

  @override
  void keepMeSignedIn() {
    // TODO: implement keepMeSignedIn
    isKeptSignedIn(!isKeptSignedIn.value);
  }

  @override
  void peekPassword() {
    isPeeked(!isPeeked.value);
  }

  @override
  void signIn() async {
    isLoading(true);

    if (usernameTextController.text.isEmpty) {
      isUserNameEmpty(true);
    }

    if (passwordTextController.text.isEmpty) {
      isPasswordEmpty(true);
    }

    if (usernameTextController.text.isNotEmpty &&
        passwordTextController.text.isNotEmpty) {
      var response = await authenticationController.authenticate(
          AuthenticateRequestDto(
              username: usernameTextController.text,
              password: passwordTextController.text));

      if (response.data!.account == null) {
        isFailedToLogin(true);
        Get.snackbar("Sign In Failed", response.message);
      }

      if (response.data!.account != null) {
        dataContextController.saveAuthenticatedUserData(response.data!);
        isFailedToLogin(false);
        usernameTextController.clear();
        passwordTextController.clear();
        homeScreenController.selectedPageIndex(0);
        homeScreenController.initializePlayerProfile();
        Get.toNamed("/home");
      }

      isLoading(false);
    }
  }
}
