import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pueblo_golf_tournament_mobile/api/lookup/ilookup-controller.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/lookup-division-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/lookup-player-profile-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/lookup-tournament-details-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/lookup-tournament-team-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/lookup-tournaments-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-division-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-player-profile-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-tournament-details-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-tournament-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-tournament-team-response-dto.dart';

import '../../utilities/http-controller.dart';

class LookupController extends ILookupController {
  var controller = "/api/v1/lookup";
  var httpController = Get.find<HttpController>();

  @override
  Future<LookupDivisionResponseDto> lookupDivisions(
      LookupDivisionRequestDto payload) async {
    var endpoint = "$controller/divisions";
    var response =
        await httpController.post(endpoint, jsonEncode(payload.toJson()));

    switch (response.statusCode) {
      case 200:
        return LookupDivisionResponseDto.fromJson(jsonDecode(response.body));
      case 400:
        Get.snackbar("Failed", response.reasonPhrase!);
        return LookupDivisionResponseDto.fromJson(jsonDecode(response.body));
      default:
        Get.snackbar("Failed", response.reasonPhrase!);
        return LookupDivisionResponseDto(
            message: response.reasonPhrase!, data: null);
    }
  }

  @override
  Future<LookupTournamentDetailsResponseDto> lookupTournamentDetails(
      LookupTournamentDetailsRequestDto payload) async {
    var endpoint = "$controller/tournament-details";
    var response =
        await httpController.post(endpoint, jsonEncode(payload.toJson()));

    switch (response.statusCode) {
      case 200:
        return LookupTournamentDetailsResponseDto.fromJson(
            jsonDecode(response.body));
      case 400:
        return LookupTournamentDetailsResponseDto.fromJson(
            jsonDecode(response.body));
      default:
        return LookupTournamentDetailsResponseDto(
            message: response.reasonPhrase!,
            playetCount: 0,
            teams: [],
            teamsCount: 0,
            tournament: null);
    }
  }

  @override
  Future<LookupTournamentTeamResponseDto> lookupTournamentTeam(
      LookupTournamentTeamRequestDto payload) async {
    var endpoint = "$controller/tournament-team";
    var response =
        await httpController.post(endpoint, jsonEncode(payload.toJson()));

    switch (response.statusCode) {
      case 200:
        return LookupTournamentTeamResponseDto.fromJson(
            jsonDecode(response.body));
      case 400:
        return LookupTournamentTeamResponseDto.fromJson(
            jsonDecode(response.body));
      default:
        return LookupTournamentTeamResponseDto(
            message: response.reasonPhrase!,
            registeredTeams: [],
            tournament: null,
            tournamentId: 0);
    }
  }

  @override
  Future<LookupTournamentResponseDto> lookupTournaments(
      LookupTournamentsRequestDto payload) async {
    var endpoint = "$controller/tournament";
    var response =
        await httpController.post(endpoint, jsonEncode(payload.toJson()));

    switch (response.statusCode) {
      case 200:
        return LookupTournamentResponseDto.fromJson(jsonDecode(response.body));
      case 400:
        Get.snackbar("Failed", response.reasonPhrase!);
        return LookupTournamentResponseDto.fromJson(jsonDecode(response.body));
      default:
        Get.snackbar("Failed", response.reasonPhrase!);
        return LookupTournamentResponseDto(
            message: response.reasonPhrase!, data: null);
    }
  }

  @override
  Future<LookupPlayeProfileResponseDto> lookupPlayerProfile(
      LookupPlayeProfileRequestDto payload) async {
    var endpoint = "$controller/player-profile";
    var response =
        await httpController.post(endpoint, jsonEncode(payload.toJson()));

    switch (response.statusCode) {
      case 200:
        return LookupPlayeProfileResponseDto.fromJson(
            jsonDecode(response.body));
      case 400:
        Get.snackbar("Failed", response.reasonPhrase!);
        return LookupPlayeProfileResponseDto.fromJson(
            jsonDecode(response.body));
      default:
        Get.snackbar("Failed", response.reasonPhrase!);
        return LookupPlayeProfileResponseDto(
            message: response.reasonPhrase!, profile: null);
    }
  }

  @override
  Future<LookupPlayeProfileResponseDto> lookupPlayerProfileByPersonId(
      LookupPlayeProfileByPersonIdRequestDto payload) async {
    var endpoint = "$controller/player-profile-by-person";
    var response =
        await httpController.post(endpoint, jsonEncode(payload.toJson()));

    switch (response.statusCode) {
      case 200:
        return LookupPlayeProfileResponseDto.fromJson(
            jsonDecode(response.body));
      case 400:
        return LookupPlayeProfileResponseDto.fromJson(
            jsonDecode(response.body));
      default:
        Get.snackbar("Failed", response.reasonPhrase!);
        return LookupPlayeProfileResponseDto(
            message: response.reasonPhrase!, profile: null);
    }
  }
}
