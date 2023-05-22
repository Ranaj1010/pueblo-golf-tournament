import 'dart:convert';

import 'package:get/get.dart';
import 'package:pueblo_golf_tournament_mobile/api/requests/lookup/lookup-division-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/api/requests/lookup/lookup-tournament-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/api/requests/lookup/lookup-tournament-team-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/api/responses/lookup/lookup-division-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/api/responses/lookup/lookup-tournament-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/api/responses/lookup/lookup-tournament-team-response-dto.dart';

import '../../controllers/services/http-controllers.dart';

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

  Future<LookupTournamentTeamResponseDto> lookupTournamentTeam(
      LookupTournamentTeamRequestDto payload) async {
    print(jsonEncode(payload.toJson()));
    var endpoint = "/tournament-team";
    var response = await httpController.post(
        "$controller$endpoint", jsonEncode(payload.toJson()));

    var parsedData =
        LookupTournamentTeamResponseDto.fromJson(jsonDecode(response.body));

    return parsedData;
  }
}
