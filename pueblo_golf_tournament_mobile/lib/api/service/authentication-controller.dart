import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pueblo_golf_tournament_mobile/api/requests/authentication/authenticate-login-dto.dart';
import 'package:pueblo_golf_tournament_mobile/api/responses/authentication/authentication-login-dto.dart';
import 'package:pueblo_golf_tournament_mobile/controllers/services/http-controllers.dart';

class AuthenticationController extends GetxController {
  final httpController = Get.find<HttpServiceController>();

  var controller = "/api/v1/authentication";
  var authenticatedUserData = Rxn<AuthenticatedUserData>();

  Future<AuthenticationLoginDto> login(AuthenticateLoginDto payload) async {
    var endpoint = "/login";
    var response = await httpController.post(
        "$controller$endpoint", jsonEncode(payload.toJson()));

    print(response.statusCode);

    print(response.reasonPhrase);
    print(response.body);

    var parsedData = AuthenticationLoginDto.fromJson(jsonDecode(response.body));

    if (response.statusCode == 200) {
      authenticatedUserData(parsedData.data);
    }

    return response.statusCode == 200
        ? parsedData
        : AuthenticationLoginDto(
            message: parsedData != null
                ? parsedData.message
                : response.reasonPhrase.toString(),
            authenticated: false,
            data: null);
  }
}
