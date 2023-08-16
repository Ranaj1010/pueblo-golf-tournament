import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/player-tee-time-schedule-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/tournament-hole-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-tee-time-schedules-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/screens/tee-time-screen/interface.dart';
import 'package:pueblo_golf_tournament_mobile/utilities/enums.dart';

class TeeTimeScreenController extends ITeeTimeScreenController {
  var tournamentScheduleDate = Rxn<TournamentScheduleDate>();

  @override
  void loadScores() {
    // TODO: implement loadScores
  }

  @override
  void saveScore(PlayerTeeTimeScheduleDto time, TournamentHoleDto hole,
      MolaveScoresEnum score) {
    // TODO: implement saveScore
  }

  @override
  void initializeTeeTime(TournamentScheduleDate scheduleDate) {
    tournamentScheduleDate(scheduleDate);
    loadScores();
  }
}
