import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/setup-tournament-schedules-request-dto.dart';

import 'package:pueblo_golf_tournament_mobile/dto/response/setup-tournament-schedules-response-dto.dart';

import '../../dto/request/setup-player-schedules-request-dto.dart';
import '../../dto/response/setup-player-schedules-response-dto.dart';
import '../../utilities/http-controller.dart';
import 'isetup-controller.dart';

class SetupController extends ISetupController {
  var controller = "/api/v1/setup";
  var httpController = Get.find<HttpController>();
  @override
  Future<SetupTournamentSchedulesResponseDto> setupTournamentSchedules(
      SetupTournamentSchedulesRequestDto payload) async {
    var endpoint = "$controller/tournament/schedules";
    var response =
        await httpController.post(endpoint, jsonEncode(payload.toJson()));

    switch (response.statusCode) {
      case 200:
        return SetupTournamentSchedulesResponseDto.fromJson(
            jsonDecode(response.body));
      case 400:
        return SetupTournamentSchedulesResponseDto.fromJson(
            jsonDecode(response.body));
      default:
        return SetupTournamentSchedulesResponseDto(
            message: response.reasonPhrase!, success: false);
    }
  }

  @override
  Future<SetupPlayerSchedulesResponseDto> setupPlayerSchedules(
      SetupPlayerSchedulesRequestDto payload) async {
    var endpoint = "$controller/player/schedules";
    var response =
        await httpController.post(endpoint, jsonEncode(payload.toJson()));

    switch (response.statusCode) {
      case 200:
        return SetupPlayerSchedulesResponseDto.fromJson(
            jsonDecode(response.body));
      case 400:
        return SetupPlayerSchedulesResponseDto.fromJson(
            jsonDecode(response.body));
      default:
        return SetupPlayerSchedulesResponseDto(
            message: response.reasonPhrase!, data: []);
    }
  }
}
