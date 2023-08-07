import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pueblo_golf_tournament_mobile/api/manage/imanage-controller.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/confirm-payment-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/update-person-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/update-player-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/update-team-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/update-tee-time-schedule-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/update-tournament-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/confirm-payment-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/update-person-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/update-player-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/update-team-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/update-tee-time-schedule-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/update-tournament-response-dto.dart';

import '../../utilities/http-controller.dart';

class ManageController extends IManageController {
  var controller = "/api/v1/manage";
  var httpController = Get.find<HttpController>();
  @override
  Future<UpdatePersonResponseDto> updatePerson(
      UpdatePersonRequestDto payload) async {
    var endpoint = "$controller/update/person";
    var response =
        await httpController.post(endpoint, jsonEncode(payload.toJson()));

    switch (response.statusCode) {
      case 200:
        return UpdatePersonResponseDto.fromJson(jsonDecode(response.body));
      case 400:
        return UpdatePersonResponseDto.fromJson(jsonDecode(response.body));
      default:
        return UpdatePersonResponseDto(
            message: response.reasonPhrase!, data: null);
    }
  }

  @override
  Future<UpdatePlayerResponseDto> updatePlayer(
      UpdatePlayerRequestDto payload) async {
    var endpoint = "$controller/update/player";
    var response =
        await httpController.post(endpoint, jsonEncode(payload.toJson()));

    switch (response.statusCode) {
      case 200:
        return UpdatePlayerResponseDto.fromJson(jsonDecode(response.body));
      case 400:
        return UpdatePlayerResponseDto.fromJson(jsonDecode(response.body));
      default:
        return UpdatePlayerResponseDto(
            message: response.reasonPhrase!, data: null);
    }
  }

  @override
  Future<UpdateTeamResponseDto> updateTeam(UpdateTeamRequestDto payload) async {
    var endpoint = "$controller/update/team";
    var response =
        await httpController.post(endpoint, jsonEncode(payload.toJson()));

    switch (response.statusCode) {
      case 200:
        return UpdateTeamResponseDto.fromJson(jsonDecode(response.body));
      case 400:
        return UpdateTeamResponseDto.fromJson(jsonDecode(response.body));
      default:
        return UpdateTeamResponseDto(
            message: response.reasonPhrase!, data: null);
    }
  }

  @override
  Future<UpdateTournamentResponseDto> updateTournament(
      UpdateTournamentRequestDto payload) async {
    var endpoint = "$controller/update/tournament";
    var response =
        await httpController.post(endpoint, jsonEncode(payload.toJson()));

    switch (response.statusCode) {
      case 200:
        return UpdateTournamentResponseDto.fromJson(jsonDecode(response.body));
      case 400:
        return UpdateTournamentResponseDto.fromJson(jsonDecode(response.body));
      default:
        return UpdateTournamentResponseDto(
            message: response.reasonPhrase!, data: null);
    }
  }

  @override
  Future<ConfirmPaymentResponseDto> confirmPayment(
      ConfirmPaymentRequestDto payload) async {
    var endpoint = "$controller/confirm/payment";
    var response =
        await httpController.post(endpoint, jsonEncode(payload.toJson()));

    switch (response.statusCode) {
      case 200:
        return ConfirmPaymentResponseDto.fromJson(jsonDecode(response.body));
      case 400:
        return ConfirmPaymentResponseDto.fromJson(jsonDecode(response.body));
      default:
        return ConfirmPaymentResponseDto(
            message: response.reasonPhrase!, payment: null, registration: null);
    }
  }

  @override
  Future<UpdateTeeTimeScheduleResponseDto> updateTeeTimeSchedule(
      UpdateTeeTimeScheduleRequestDto payload) async {
    var endpoint = "$controller/update/tee-time-schedule";
    var response =
        await httpController.post(endpoint, jsonEncode(payload.toJson()));

    switch (response.statusCode) {
      case 200:
        return UpdateTeeTimeScheduleResponseDto.fromJson(
            jsonDecode(response.body));
      case 400:
        return UpdateTeeTimeScheduleResponseDto.fromJson(
            jsonDecode(response.body));
      default:
        return UpdateTeeTimeScheduleResponseDto(
          message: response.reasonPhrase!,
          data: null,
        );
    }
  }
}
