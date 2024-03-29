import 'package:get/get.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/register-division-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/register-payment-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/register-player-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/register-scorer-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/register-team-division-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/register-team-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/register-tournament-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/register-account-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/register-division-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/register-payment-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/register-person-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/register-player-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/register-scorer-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/register-team-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/register-tournament-response-dto.dart';

import '../../dto/request/register-account-request-dto.dart';
import '../../dto/request/register-person-request-dto.dart';
import '../../dto/request/register-tournament-player-request-dto.dart';
import '../../dto/request/register-tournament-scorer-request-dto.dart';
import '../../dto/response/register-team-division-response-dto.dart';
import '../../dto/response/register-tournament-player-response-dto.dart';
import '../../dto/response/register-tournament-scorer-response-dto.dart';

abstract class IRegistrationController extends GetxController {
  Future<RegisterTournamentResponseDto> registerTournament(
      RegisterTournamentRequestDto payload);
  Future<RegisterDivisionResponseDto> registerDivision(
      RegisterDivisionRequestDto payload);
  Future<RegisterTeamResponseDto> registerTeam(RegisterTeamRequestDto payload);
  Future<RegisterAccountResponseDto> registerAccount(
      ReqisterAccountRequesDto payload);
  Future<RegisterPersonResponseDto> registerPerson(
      ReqisterPersonRequesDto payload);
  Future<RegisterPlayerResponseDto> registerPlayer(
      RegisterPlayerRequestDto payload);
  Future<RegisterTournamentPlayerResponseDto> registerTournamentPlayer(
      RegisterTournamentPlayerRequestDto payload);
  Future<RegisterPaymentResponseDto> registerPayment(
      RegisterPaymentRequestDto payload);
  Future<RegisterPaymentResponseDto> registerPaymentWeb(
      RegisterPaymentWebRequestDto payload);
  Future<RegisterTeamDivisionResponseDto> registerTeamDivision(
      RegisterTeamDivisionRequestDto payload);
  Future<RegisterScorerResponseDto> registerScorer(
      RegisterScorerRequestDto payload);
  Future<ReqisterTournamentScorerResponseDto> registerTournamentScorer(
      ReqisterTournamentScorerRequestDto payload);
}
