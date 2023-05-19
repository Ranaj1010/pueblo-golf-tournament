import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pueblo_golf_tournament_mobile/api/requests/authentication/authenticate-login-dto.dart';
import 'package:pueblo_golf_tournament_mobile/api/service/authentication-controller.dart';
import 'package:pueblo_golf_tournament_mobile/controllers/services/http-controllers.dart';

class LoginScreenController extends GetxController {
  var usernameTextController = TextEditingController();
  var passwordTextController = TextEditingController();
  var peekPassword = false.obs;

  final authenticationController = Get.find<AuthenticationController>();

  void togglePeek() {
    peekPassword(!peekPassword.value);
  }

  void signIn() async {
    var response = await authenticationController.login(AuthenticateLoginDto(
        username: usernameTextController.text,
        password: passwordTextController.text));

    if (response.authenticated) {
      usernameTextController.clear();
      passwordTextController.clear();
      Get.offAllNamed("/home");
    }

    if (!response.authenticated) {
      Get.snackbar("Login Failed", response.message);
    }
  }
}
