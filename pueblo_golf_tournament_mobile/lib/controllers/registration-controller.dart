import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pueblo_golf_tournament_mobile/controllers/http-service-controller.dart';
import 'package:pueblo_golf_tournament_mobile/dtos/outgoing/register-account-dto.dart';
import 'package:http/http.dart' as http;

import '../services/http-service.dart';

class RegistrationController extends GetxController {
  late var loadingRegistration = false.obs;
  late var completeAndSuccess = false.obs;
  late var completeAndFailed = false.obs;

  final httpServiceController = Get.find<HttpServiceController>();

  registerAccount(RegisterAccountDto dto) async {
    loadingRegistration(true);
    var endpoint = "api/v1/registration/account";
    print(jsonEncode(dto.toJson()));
    var url = Uri.http('192.168.1.7:5064', endpoint);
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    print(url);

    var response =
        await http.post(url, body: jsonEncode(dto.toJson()), headers: headers);

    if (response.statusCode == 200) {
      completeAndSuccess = true.obs;
      Get.toNamed('/account-registration-success');
    }

    if (response.statusCode != 200) {
      completeAndFailed = true.obs;
      Get.snackbar("Registration failed", "${response.reasonPhrase}");
    }

    loadingRegistration(false);
  }

  goToLoginScreen() {
    Get.offAllNamed("login");
  }
}
