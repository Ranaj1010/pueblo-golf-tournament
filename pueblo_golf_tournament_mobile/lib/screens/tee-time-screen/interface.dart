import 'package:get/get.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/player-tee-time-schedule-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/tournament-hole-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-tee-time-schedules-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/utilities/enums.dart';

abstract class ITeeTimeScreenController extends GetxController {
  void initializeTeeTime(TournamentScheduleDate scheduleDate);
  void loadScores();
  void saveScore(PlayerTeeTimeScheduleDto time, TournamentHoleDto hole,
      MolaveScoresEnum score);
}
