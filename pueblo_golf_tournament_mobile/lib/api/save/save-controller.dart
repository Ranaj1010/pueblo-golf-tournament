import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pueblo_golf_tournament_mobile/api/save/isave-controller.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/save-tournament-player-score-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/save-tournament-player-score-response-dto.dart';

import '../../utilities/http-controller.dart';

class SaveController extends ISaveController {
  var controller = "/api/v1/save";
  var httpController = Get.find<HttpController>();
  @override
  Future<SaveTournamentPlayerScoreResponseDto> savedTournamentPlayerScore(
      SaveTournamentPlayerScoreRequestDto payload) async {
    var endpoint = "$controller/player/score";
    var response =
        await httpController.post(endpoint, jsonEncode(payload.toJson()));

    switch (response.statusCode) {
      case 200:
        return SaveTournamentPlayerScoreResponseDto.fromJson(
            jsonDecode(response.body));
      case 400:
        return SaveTournamentPlayerScoreResponseDto.fromJson(
            jsonDecode(response.body));
      default:
        return SaveTournamentPlayerScoreResponseDto(
            message: response.reasonPhrase!, data: null);
    }
  }
}
