import 'dart:convert';

import 'package:get/get.dart';
import 'package:pueblo_golf_tournament_web/api/lookups/requests/lookup-division-request-dto.dart';
import 'package:pueblo_golf_tournament_web/api/lookups/requests/lookup-tournament-request-dto.dart';
import 'package:pueblo_golf_tournament_web/api/lookups/response/lookup-division-response-dto.dart';
import 'package:pueblo_golf_tournament_web/api/lookups/response/lookup-tournament-response-dto.dart';

import '../service/http-controller.dart';

class LookupController extends GetxController {
  final httpController = Get.find<HttpServiceController>();

  var controller = "/api/v1/lookup";

  Future<LookupTournamentResponseDto> lookupTournaments(
      LookupTournamentRequestDto payload) async {
    var endpoint = "/tournament";
    var response = await httpController.post(
        "$controller$endpoint", jsonEncode(payload.toJson()));

    var parsedData =
        LookupTournamentResponseDto.fromJson(jsonDecode(response.body));

    return parsedData;
  }

  Future<LookupDivisionResponseDto> lookupDivisions(
      LookupDivisionRequestDto payload) async {
    var endpoint = "/divisions";
    var response = await httpController.post(
        "$controller$endpoint", jsonEncode(payload.toJson()));
    print(jsonEncode(payload.toJson()));
    var parsedData =
        LookupDivisionResponseDto.fromJson(jsonDecode(response.body));

    return parsedData;
  }
}
