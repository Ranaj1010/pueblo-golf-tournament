import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pueblo_golf_tournament_mobile/api/lookup/ilookup-controller.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/lookup-division-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/lookup-leader-board-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/lookup-payment-channel-accounts-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/lookup-payment-channels-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/lookup-player-profile-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/lookup-player-scores-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/lookup-player-tee-time-schedule-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/lookup-scorer-profile-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/lookup-tee-time-schedule-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/lookup-tournament-details-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/lookup-tournament-team-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/lookup-tournaments-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-division-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-leader-board-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-payment-channel-accounts-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-payment-channels-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-player-profile-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-player-scores-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-player-tee-time-schedules-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-scorer-profile-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-tee-time-schedules-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-tournament-details-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-tournament-holes-response-dto.dart';
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

  @override
  Future<LookupPaymentChannelAccountsResponseDto> lookupPaymentChannelAccounts(
      LookupPaymentChannelAccountsRequestDto payload) async {
    var endpoint = "$controller/payment-channel-accounts";
    var response =
        await httpController.post(endpoint, jsonEncode(payload.toJson()));

    switch (response.statusCode) {
      case 200:
        return LookupPaymentChannelAccountsResponseDto.fromJson(
            jsonDecode(response.body));
      case 400:
        return LookupPaymentChannelAccountsResponseDto.fromJson(
            jsonDecode(response.body));
      default:
        Get.snackbar("Failed", response.reasonPhrase!);
        return LookupPaymentChannelAccountsResponseDto(
            message: response.reasonPhrase!, data: null);
    }
  }

  @override
  Future<LookupPaymentChannelsResponseDto> lookupPaymentChannels(
      LookupPaymentChannelsRequestDto payload) async {
    var endpoint = "$controller/payment-channels";
    var response =
        await httpController.post(endpoint, jsonEncode(payload.toJson()));

    switch (response.statusCode) {
      case 200:
        return LookupPaymentChannelsResponseDto.fromJson(
            jsonDecode(response.body));
      case 400:
        return LookupPaymentChannelsResponseDto.fromJson(
            jsonDecode(response.body));
      default:
        Get.snackbar("Failed", response.reasonPhrase!);
        return LookupPaymentChannelsResponseDto(
            message: response.reasonPhrase!, data: null);
    }
  }

  @override
  Future<LookupTeeTimeScheduleResponse> lookupTeeTimeSchedules(
      LookupTeeTimeScheduleRequest payload) async {
    var endpoint = "$controller/tee-time-schedules";
    var response =
        await httpController.post(endpoint, jsonEncode(payload.toJson()));

    switch (response.statusCode) {
      case 200:
        return LookupTeeTimeScheduleResponse.fromJson(
            jsonDecode(response.body));
      case 400:
        return LookupTeeTimeScheduleResponse.fromJson(
            jsonDecode(response.body));
      default:
        Get.snackbar("Failed", response.reasonPhrase!);
        return LookupTeeTimeScheduleResponse(
            message: response.reasonPhrase!, data: null);
    }
  }

  @override
  Future<LookupPlayerTeeTimeScheduleResponse> lookupPlayerTeeTimeSchedules(
      LookupPlayerTeeTimeScheduleRequest payload) async {
    var endpoint = "$controller/player-tee-time-schedules";
    var response =
        await httpController.post(endpoint, jsonEncode(payload.toJson()));

    switch (response.statusCode) {
      case 200:
        return LookupPlayerTeeTimeScheduleResponse.fromJson(
            jsonDecode(response.body));
      case 400:
        return LookupPlayerTeeTimeScheduleResponse.fromJson(
            jsonDecode(response.body));
      default:
        Get.snackbar("Failed", response.reasonPhrase!);
        return LookupPlayerTeeTimeScheduleResponse(
            message: response.reasonPhrase!, data: null, playerId: 0);
    }
  }

  @override
  Future<LookupTournamentHolesResponseDto> lookupTournamentHoles(
      LookupTournamentDetailsRequestDto payload) async {
    var endpoint = "$controller/tournament-holes";
    var response =
        await httpController.post(endpoint, jsonEncode(payload.toJson()));

    switch (response.statusCode) {
      case 200:
        return LookupTournamentHolesResponseDto.fromJson(
            jsonDecode(response.body));
      case 400:
        return LookupTournamentHolesResponseDto.fromJson(
            jsonDecode(response.body));
      default:
        Get.snackbar("Failed", response.reasonPhrase!);
        return LookupTournamentHolesResponseDto(
          message: response.reasonPhrase!,
          data: [],
          tournamentId: 0,
        );
    }
  }

  @override
  Future<LookupScorerProfileResponseDto> lookupScorerProfile(
      LookupScorerProfilesRequestDto payload) async {
    var endpoint = "$controller/scorer-profiles";
    var response =
        await httpController.post(endpoint, jsonEncode(payload.toJson()));

    switch (response.statusCode) {
      case 200:
        return LookupScorerProfileResponseDto.fromJson(
            jsonDecode(response.body));
      case 400:
        return LookupScorerProfileResponseDto.fromJson(
            jsonDecode(response.body));
      default:
        Get.snackbar("Failed", response.reasonPhrase!);
        return LookupScorerProfileResponseDto(
          message: response.reasonPhrase!,
          data: [],
        );
    }
  }

  @override
  Future<LookupPlayerScoresResponse> lookupPlayerScores(
      LookupPlayerScoresRequest payload) async {
    var endpoint = "$controller/player-scores";
    var response =
        await httpController.post(endpoint, jsonEncode(payload.toJson()));

    switch (response.statusCode) {
      case 200:
        return LookupPlayerScoresResponse.fromJson(jsonDecode(response.body));
      case 400:
        return LookupPlayerScoresResponse.fromJson(jsonDecode(response.body));
      default:
        Get.snackbar("Failed", response.reasonPhrase!);
        return LookupPlayerScoresResponse(
          message: response.reasonPhrase!,
          data: [],
        );
    }
  }

  @override
  Future<LookupLeaderBoardResponseDto> lookupLeaderBoard(
      LookupLeaderBoardRequestDto payload) async {
    var endpoint = "$controller/leader-board";
    var response =
        await httpController.post(endpoint, jsonEncode(payload.toJson()));

    switch (response.statusCode) {
      case 200:
        return LookupLeaderBoardResponseDto.fromJson(jsonDecode(response.body));
      case 400:
        return LookupLeaderBoardResponseDto.fromJson(jsonDecode(response.body));
      default:
        Get.snackbar("Failed", response.reasonPhrase!);
        return LookupLeaderBoardResponseDto(
          message: response.reasonPhrase!,
          data: [],
        );
    }
  }
}
