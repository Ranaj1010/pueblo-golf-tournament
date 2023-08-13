import 'package:get/get.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/tournament-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-tournament-team-response-dto.dart';

abstract class ITournamentDetailsScreenController extends GetxController {
  void loadTournamentDetails();
  void registerTeam();
  void selectTournament(TournamentDto tournament);
  void selectRegisteredTeam(RegisteredTeam team);
  void gotoManageSchedules();
  void gotoSetupHoles();
}
