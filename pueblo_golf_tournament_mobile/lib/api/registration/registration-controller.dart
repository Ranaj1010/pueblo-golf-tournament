import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pueblo_golf_tournament_mobile/api/registration/iregistration-controller.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/payment-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/register-account-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/register-division-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/register-person-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/register-player-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/register-scorer-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/register-team-division-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/register-team-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/register-tournament-player-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/register-tournament-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/register-tournament-scorer-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/register-account-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/register-division-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/register-payment-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/register-person-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/register-player-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/register-scorer-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/register-team-division-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/register-team-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/register-tournament-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/register-tournament-scorer-response-dto.dart';

import '../../dto/request/register-payment-request-dto.dart';
import '../../dto/response/register-tournament-player-response-dto.dart';
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

  @override
  Future<RegisterPaymentResponseDto> registerPayment(
      RegisterPaymentRequestDto payload) async {
    var endpoint = "$controller/payment";
    var fields = {
      "PaymentMethod": payload.paymentMethod.toString(),
      "ReferrenceId": payload.referrenceId.toString(),
      "RegistrationId": payload.registrationId.toInt().toString(),
      "PaymentChannelAccountId": payload.paymentChannelAccountId.toString(),
      "AccountName": payload.accountName.toString(),
      "AccountNumber": payload.accountNumber.toString()
    };

    print(fields);

    var response = await httpController.upload(endpoint,
        "PaymentReferrencePhoto", payload.paymentReferrencePhoto, fields);

    switch (response.statusCode) {
      case 200:
        var responseData = await response.stream.toBytes();
        var dataString = String.fromCharCodes(responseData);
        var responseJson = jsonDecode(dataString);
        return RegisterPaymentResponseDto.fromJson(responseJson);
      case 400:
        var responseData = await response.stream.toBytes();
        var dataString = String.fromCharCodes(responseData);
        var responseJson = jsonDecode(dataString);
        return RegisterPaymentResponseDto.fromJson(responseJson);
      default:
        return RegisterPaymentResponseDto(
            message: response.reasonPhrase!, data: null);
    }
  }

  @override
  Future<RegisterPaymentResponseDto> registerPaymentWeb(
      RegisterPaymentWebRequestDto payload) async {
    var endpoint = "$controller/payment";
    var fields = {
      "PaymentMethod": payload.paymentMethod.toString(),
      "ReferrenceId": payload.referrenceId.toString(),
      "RegistrationId": payload.registrationId.toInt().toString(),
      "PaymentChannelAccountId": payload.paymentChannelAccountId.toString(),
      "AccountName": payload.accountName.toString(),
      "AccountNumber": payload.accountNumber.toString(),
    };

    print(fields);
    var response = await httpController.uploadFromByes(
      endpoint,
      "PaymentReferrencePhoto",
      payload.paymentReferrencePhoto,
      "${payload.registrationId}_${payload.referrenceId.toString()}.jpg",
      fields,
    );

    switch (response.statusCode) {
      case 200:
        var responseData = await response.stream.toBytes();
        var dataString = String.fromCharCodes(responseData);
        var responseJson = jsonDecode(dataString);
        return RegisterPaymentResponseDto.fromJson(responseJson);
      case 400:
        var responseData = await response.stream.toBytes();
        var dataString = String.fromCharCodes(responseData);
        var responseJson = jsonDecode(dataString);
        return RegisterPaymentResponseDto.fromJson(responseJson);
      default:
        return RegisterPaymentResponseDto(
            message: response.reasonPhrase!, data: null);
    }
  }

  @override
  Future<RegisterTournamentPlayerResponseDto> registerTournamentPlayer(
      RegisterTournamentPlayerRequestDto payload) async {
    var endpoint = "$controller/tournament-player";
    var response =
        await httpController.post(endpoint, jsonEncode(payload.toJson()));

    switch (response.statusCode) {
      case 200:
        return RegisterTournamentPlayerResponseDto.fromJson(
            jsonDecode(response.body));
      case 400:
        return RegisterTournamentPlayerResponseDto.fromJson(
            jsonDecode(response.body));
      default:
        return RegisterTournamentPlayerResponseDto(
            message: response.reasonPhrase!, playerProfile: null);
    }
  }

  @override
  Future<RegisterTeamDivisionResponseDto> registerTeamDivision(
      RegisterTeamDivisionRequestDto payload) async {
    var endpoint = "$controller/team-division";
    var response =
        await httpController.post(endpoint, jsonEncode(payload.toJson()));

    switch (response.statusCode) {
      case 200:
        return RegisterTeamDivisionResponseDto.fromJson(
            jsonDecode(response.body));
      case 400:
        return RegisterTeamDivisionResponseDto.fromJson(
            jsonDecode(response.body));
      default:
        return RegisterTeamDivisionResponseDto(
            message: response.reasonPhrase!, data: null);
    }
  }

  @override
  Future<ReqisterTournamentScorerResponseDto> registerTournamentScorer(
      ReqisterTournamentScorerRequestDto payload) async {
    var endpoint = "$controller/tournament-scorer";
    var response =
        await httpController.post(endpoint, jsonEncode(payload.toJson()));

    switch (response.statusCode) {
      case 200:
        return ReqisterTournamentScorerResponseDto.fromJson(
            jsonDecode(response.body));
      case 400:
        return ReqisterTournamentScorerResponseDto.fromJson(
            jsonDecode(response.body));
      default:
        return ReqisterTournamentScorerResponseDto(
            message: response.reasonPhrase!, success: false);
    }
  }

  @override
  Future<RegisterScorerResponseDto> registerScorer(
      RegisterScorerRequestDto payload) async {
    var endpoint = "$controller/scorer";
    var response =
        await httpController.post(endpoint, jsonEncode(payload.toJson()));

    switch (response.statusCode) {
      case 200:
        return RegisterScorerResponseDto.fromJson(jsonDecode(response.body));
      case 400:
        return RegisterScorerResponseDto.fromJson(jsonDecode(response.body));
      default:
        return RegisterScorerResponseDto(
          message: response.reasonPhrase!,
          data: null,
        );
    }
  }
}
