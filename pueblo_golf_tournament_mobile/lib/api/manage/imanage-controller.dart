import 'package:get/get.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/confirm-payment-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/update-person-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/update-team-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/update-tournament-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/confirm-payment-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/update-person-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/update-player-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/update-team-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/update-tournament-response-dto.dart';

import '../../dto/request/update-player-request-dto.dart';

abstract class IManageController extends GetxController {
  Future<UpdatePersonResponseDto> updatePerson(UpdatePersonRequestDto payload);
  Future<UpdatePlayerResponseDto> updatePlayer(UpdatePlayerRequestDto payload);
  Future<UpdateTeamResponseDto> updateTeam(UpdateTeamRequestDto payload);
  Future<UpdateTournamentResponseDto> updateTournament(
      UpdateTournamentRequestDto payload);
  Future<ConfirmPaymentResponseDto> confirmPayment(
      ConfirmPaymentRequestDto payload);
}
