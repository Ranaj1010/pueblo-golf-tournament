import 'package:get/get.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/tournament-dto.dart';

abstract class ITournamentsScreenController extends GetxController {
  void loadTournaments();
  void viewTournamentDetails(TournamentDto tournament);
}
