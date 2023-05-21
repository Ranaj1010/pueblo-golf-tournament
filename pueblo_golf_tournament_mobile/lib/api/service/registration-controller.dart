import 'dart:convert';

import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pueblo_golf_tournament_mobile/api/requests/registration/register-account-dto.dart';
import 'package:pueblo_golf_tournament_mobile/api/requests/registration/register-team-dto.dart';
import 'package:pueblo_golf_tournament_mobile/api/responses/registration/registered-account-dto.dart';
import 'package:pueblo_golf_tournament_mobile/api/responses/registration/registered-team-dto.dart';

import '../../controllers/services/http-controllers.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

class RegistrationController extends GetxController {
  final httpController = Get.find<HttpServiceController>();
  var controller = "/api/v1/registration";

  String baseUrl = "";
  Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  RegistrationController() {
    baseUrl = FlavorConfig.instance.variables["baseUrl"];
  }

  Future<RegisteredAccountDto> registerAccount(
      RegisterAccountDto payload) async {
    var endpoint = "/account";
    var body = jsonEncode(payload.toJson());

    print(body);

    var response = await httpController.post("$controller$endpoint", body);
    print(response.statusCode);
    print(response.reasonPhrase);
    var parsedData = RegisteredAccountDto.fromJson(jsonDecode(response.body));

    print(parsedData.message);
    return response.statusCode == 200
        ? parsedData
        : RegisteredAccountDto(
            null,
            message: parsedData != null
                ? parsedData.message
                : response.reasonPhrase.toString(),
          );
  }

  Future<RegisteredTeamDto> registerTeam(RegisterTeamDto payload) async {
    var endpoint = "/team";
    var body = jsonEncode(payload.toJson());

    print(body);

    var response = await httpController.post("$controller$endpoint", body);
    print(response.body);
    print(response.reasonPhrase);
    print(response.statusCode);
    var parsedData = RegisteredTeamDto.fromJson(jsonDecode(response.body));

    return response.statusCode == 200
        ? parsedData
        : RegisteredTeamDto(
            message: parsedData != null
                ? parsedData.message
                : response.reasonPhrase.toString(),
            data: null,
          );
  }

  Future<bool> registerTeamImages(
      int teamId, File paymentFile, File logoFile) async {
    var endpoint = "/team-images";
    var url = Uri.http(baseUrl, "$controller$endpoint");
//create multipart request for POST or PATCH method
    var request = http.MultipartRequest("POST", url);
    //add text fields
    request.fields["TeamId"] = teamId.toString();
    //create multipart using filepath, string or bytes
    var logoPic =
        await http.MultipartFile.fromPath("LogoImageFile", logoFile.path);
    var paymentPic =
        await http.MultipartFile.fromPath("PaymentImageFile", paymentFile.path);
    //add multipart to request
    request.files.add(logoPic);
    request.files.add(paymentPic);

    var response = await request.send();

    //Get the response from the server
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);

    print(request.url);
    print(responseString);
    print(response.statusCode);
    print(response.reasonPhrase);

    return response.statusCode == 200;
  }
}
