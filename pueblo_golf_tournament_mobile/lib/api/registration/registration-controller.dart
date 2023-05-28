import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pueblo_golf_tournament_mobile/api/registration/iregistration-controller.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/register-account-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/register-division-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/register-person-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/register-player-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/register-team-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/register-tournament-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/register-account-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/register-division-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/register-person-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/register-player-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/register-team-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/register-tournament-response-dto.dart';

import '../../utilities/http-controller.dart';

class RegistrationController extends IRegistrationController {
  var controller = "/api/v1/registration";
  var httpController = Get.find<HttpController>();

  @override
  Future<RegisterAccountResponseDto> registerAccount(
      ReqisterAccountRequesDto payload) async {
    var endpoint = "$controller/account";
    var response =
        await httpController.post(endpoint, jsonEncode(payload.toJson()));

    switch (response.statusCode) {
      case 200:
        return RegisterAccountResponseDto.fromJson(jsonDecode(response.body));
      case 400:
        return RegisterAccountResponseDto.fromJson(jsonDecode(response.body));
      default:
        return RegisterAccountResponseDto(
            message: response.reasonPhrase!, data: null);
    }
  }

  @override
  Future<RegisterDivisionResponseDto> registerDivision(
      RegisterDivisionRequestDto payload) async {
    var endpoint = "$controller/division";
    var response =
        await httpController.post(endpoint, jsonEncode(payload.toJson()));

    switch (response.statusCode) {
      case 200:
        return RegisterDivisionResponseDto.fromJson(jsonDecode(response.body));
      case 400:
        return RegisterDivisionResponseDto.fromJson(jsonDecode(response.body));
      default:
        return RegisterDivisionResponseDto(
            message: response.reasonPhrase!, data: null);
    }
  }

  @override
  Future<RegisterPersonResponseDto> registerPerson(
      ReqisterPersonRequesDto payload) async {
    var endpoint = "$controller/person";
    var response =
        await httpController.post(endpoint, jsonEncode(payload.toJson()));

    switch (response.statusCode) {
      case 200:
        return RegisterPersonResponseDto.fromJson(jsonDecode(response.body));
      case 400:
        return RegisterPersonResponseDto.fromJson(jsonDecode(response.body));
      default:
        return RegisterPersonResponseDto(
            message: response.reasonPhrase!, data: null);
    }
  }

  @override
  Future<RegisterPlayerResponseDto> registerPlayer(
      RegisterPlayerRequestDto payload) async {
    var endpoint = "$controller/player";
    var response =
        await httpController.post(endpoint, jsonEncode(payload.toJson()));

    switch (response.statusCode) {
      case 200:
        return RegisterPlayerResponseDto.fromJson(jsonDecode(response.body));
      case 400:
        return RegisterPlayerResponseDto.fromJson(jsonDecode(response.body));
      default:
        return RegisterPlayerResponseDto(
            message: response.reasonPhrase!, playerProfile: null);
    }
  }

  @override
  Future<RegisterTeamResponseDto> registerTeam(
      RegisterTeamRequestDto payload) async {
    var endpoint = "$controller/team";
    var response =
        await httpController.post(endpoint, jsonEncode(payload.toJson()));

    switch (response.statusCode) {
      case 200:
        return RegisterTeamResponseDto.fromJson(jsonDecode(response.body));
      case 400:
        return RegisterTeamResponseDto.fromJson(jsonDecode(response.body));
      default:
        return RegisterTeamResponseDto(
            message: response.reasonPhrase!, data: null);
    }
  }

  @override
  Future<RegisterTournamentResponseDto> registerTournament(
      RegisterTournamentRequestDto payload) async {
    var endpoint = "$controller/team";
    var response =
        await httpController.post(endpoint, jsonEncode(payload.toJson()));

    switch (response.statusCode) {
      case 200:
        return RegisterTournamentResponseDto.fromJson(
            jsonDecode(response.body));
      case 400:
        return RegisterTournamentResponseDto.fromJson(
            jsonDecode(response.body));
      default:
        return RegisterTournamentResponseDto(
            message: response.reasonPhrase!, data: null);
    }
  }
}
