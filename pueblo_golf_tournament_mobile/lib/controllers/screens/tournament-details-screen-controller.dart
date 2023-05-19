import 'package:get/get.dart';
import 'package:pueblo_golf_tournament_mobile/api/requests/lookup/lookup-division-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/api/requests/lookup/lookup-tournament-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/models/tournament.dart';

import '../../api/service/lookup-controller.dart';
import '../../models/division.dart';

class TournamentDetailsScreenController extends GetxController {
  var divisions = <Division>[].obs;
  var selectedTournament = Rxn<Tournament>();
  var selectedDivision = Rxn<Division>();
  final lookupController = Get.find<LookupController>();

  loadDivisions(int tournamentId) async {
    divisions.clear();
    if (selectedTournament.value != null) {
      var response = await lookupController
          .lookupDivisions(LookupDivisionRequestDto("", tournamentId.toInt()));
      divisions.addAll(response.data.map((e) =>
          Division(name: e.name, tournamentId: e.tournamentId, id: e.id)));
    }
  }

  void setSelectedTournament(Tournament tournament) {
    selectedTournament(tournament);
  }

  void setSelectedDivision(Division division) {
    selectedDivision(division);
  }

  void goToRegisterTeam() {
    Get.toNamed("/register-team");
  }
}
