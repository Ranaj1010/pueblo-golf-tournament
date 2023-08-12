import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/setup-player-schedules-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/setup-tournament-schedules-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/setup-player-schedules-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/setup-tournament-schedules-response-dto.dart';

abstract class ISetupController extends GetxController {
  Future<SetupTournamentSchedulesResponseDto> setupTournamentSchedules(
      SetupTournamentSchedulesRequestDto payload);
  Future<SetupPlayerSchedulesResponseDto> setupPlayerSchedules(
      SetupPlayerSchedulesRequestDto payload);
}
