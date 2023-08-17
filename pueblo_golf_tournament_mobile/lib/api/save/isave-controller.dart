import 'package:get/get.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/save-tournament-player-score-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/save-tournament-player-score-response-dto.dart';

abstract class ISaveController extends GetxController {
  Future<SaveTournamentPlayerScoreResponseDto> savedTournamentPlayerScore(
      SaveTournamentPlayerScoreRequestDto payload);
}
