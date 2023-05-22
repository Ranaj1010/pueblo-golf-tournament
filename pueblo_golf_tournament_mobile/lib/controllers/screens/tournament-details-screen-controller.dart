import 'package:get/get.dart';
import 'package:pueblo_golf_tournament_mobile/api/dtos/division-dto.dart';
import 'package:pueblo_golf_tournament_mobile/api/dtos/registration-dto.dart';
import 'package:pueblo_golf_tournament_mobile/api/dtos/team-dto.dart';
import 'package:pueblo_golf_tournament_mobile/api/requests/lookup/lookup-division-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/api/requests/lookup/lookup-tournament-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/api/requests/lookup/lookup-tournament-team-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/api/service/authentication-controller.dart';
import 'package:pueblo_golf_tournament_mobile/models/tournament.dart';

import '../../api/service/lookup-controller.dart';
import '../../models/division.dart';

class TournamentDetailsScreenController extends GetxController {
  var divisions = <Division>[].obs;
  var selectedTournament = Rxn<Tournament>();
  var selectedDivision = Rxn<Division>();
  var registeredTeam = Rxn<TeamDto?>();
  var registeredDivision = Rxn<DivisionDto?>();
  var registeredRegistration = Rxn<RegistrationDto?>();

  final lookupController = Get.find<LookupController>();
  final authenticatedController = Get.find<AuthenticationController>();

  loadDivisions(int tournamentId) async {
    divisions.clear();
    if (selectedTournament.value != null) {
      var response = await lookupController
          .lookupDivisions(LookupDivisionRequestDto("", tournamentId.toInt()));
      divisions.addAll(response.data.map((e) =>
          Division(name: e.name, tournamentId: e.tournamentId, id: e.id)));
    }
    loadRegistration();
  }

  loadRegistration() async {
    registeredDivision.value = null;
    registeredTeam.value = null;
    registeredRegistration.value = null;
    update();
    if (selectedTournament.value != null &&
        authenticatedController.authenticatedUserData != null) {
      var response = await lookupController.lookupTournamentTeam(
          LookupTournamentTeamRequestDto(
              tournamentId: selectedTournament.value!.id,
              teamCaptainId: authenticatedController
                  .authenticatedUserData.value!.playerDetails!.id));

      if (response.registration != null) {
        registeredRegistration(response.registration);
        registeredDivision(response.division);
        registeredTeam(response.team);
      }
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
