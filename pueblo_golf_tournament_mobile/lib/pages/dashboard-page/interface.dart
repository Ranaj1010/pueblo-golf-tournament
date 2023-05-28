import 'package:get/get.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/tournament-dto.dart';

abstract class IDashboardPageController extends GetxController {
  void loadTournaments();
  void searchTournament();
  void selectTournament(TournamentDto tournament);
  void viewMoreTournaments();
}
