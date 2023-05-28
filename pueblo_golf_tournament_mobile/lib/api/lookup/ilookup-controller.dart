import 'package:get/get_state_manager/src/simple/get_controllers.dart';
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

abstract class ILookupController extends GetxController {
  Future<LookupTournamentResponseDto> lookupTournaments(
      LookupTournamentsRequestDto payload);
  Future<LookupTournamentDetailsResponseDto> lookupTournamentDetails(
      LookupTournamentDetailsRequestDto payload);
  Future<LookupDivisionResponseDto> lookupDivisions(
      LookupDivisionRequestDto payload);
  Future<LookupTournamentTeamResponseDto> lookupTournamentTeam(
      LookupTournamentTeamRequestDto payload);
  Future<LookupPlayeProfileResponseDto> lookupPlayerProfile(
      LookupPlayeProfileRequestDto payload);
  Future<LookupPlayeProfileResponseDto> lookupPlayerProfileByPersonId(
      LookupPlayeProfileByPersonIdRequestDto payload);
}
