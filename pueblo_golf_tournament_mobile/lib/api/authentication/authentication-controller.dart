import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pueblo_golf_tournament_mobile/api/authentication/iauthentication-controller.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/authenticate-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/authenticate-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/utilities/http-controller.dart';

class AuthenticateController extends IAuthenticationController {
  var controller = "/api/v1/authentication";
  var httpController = Get.find<HttpController>();
  @override
  Future<AuthenticateResponseDto> authenticate(
      AuthenticateRequestDto payload) async {
    var endpoint = "$controller/login";
    var response =
        await httpController.post(endpoint, jsonEncode(payload.toJson()));

    switch (response.statusCode) {
      case 200:
        var parsed =
            AuthenticateResponseDto.fromJson(jsonDecode(response.body));

        return parsed;
      case 400:
        return AuthenticateResponseDto.fromJson(jsonDecode(response.body));

      case 401:
        return AuthenticateResponseDto.fromJson(jsonDecode(response.body));

      default:
        return AuthenticateResponseDto(
            message: response.reasonPhrase!, authenticated: false, data: null);
    }
  }
}
