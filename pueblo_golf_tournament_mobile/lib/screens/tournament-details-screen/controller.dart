import 'dart:convert';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:pueblo_golf_tournament_mobile/api/lookup/lookup-controller.dart';
import 'package:pueblo_golf_tournament_mobile/data/context.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/registration-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/tournament-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/lookup-tournament-team-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/screens/registered-team-details-screen/controller.dart';
import 'package:pueblo_golf_tournament_mobile/screens/tournament-details-screen/interface.dart';

import '../../dto/response/lookup-tournament-team-response-dto.dart';

class TournamentDetailsScreenController
    extends ITournamentDetailsScreenController {
  var selectedTournament = Rxn<TournamentDto>();
  var loadingRegistrations = false.obs;
  var registeredTeams = <RegisteredTeam>[].obs;
  final lookupController = Get.find<LookupController>();
  final dataContextController = Get.find<DataContextController>();
  final registeredTeamDetails =
      Get.find<RegisteredTeamDetailsScreenController>();

  @override
  void loadTeamRegistration() async {
    loadingRegistrations(true);
    registeredTeams.clear();
    if (selectedTournament.value != null) {
      var response = await lookupController.lookupTournamentTeam(
          LookupTournamentTeamRequestDto(
              tournamentId: selectedTournament.value!.id,
              teamCaptainId: dataContextController
                          .authenticatedData.value!.account!.accountType ==
                      2
                  ? dataContextController.playerProfile.value!.player.id
                  : 0));
      print(jsonEncode(response));
      if (response.registeredTeams.isNotEmpty) {
        registeredTeams.addAll(response.registeredTeams);
      }
    }

    loadingRegistrations(false);
  }

  @override
  void loadTournamentDetails() {
    // TODO: implement loadTournamentDetails
  }

  @override
  void registerTeam() async {
    var registerTeam = await Get.toNamed("/register-team");
    if (registerTeam != null) {
      loadTeamRegistration();
    }
  }

  @override
  void selectTournament(TournamentDto tournament) async {
    selectedTournament(tournament);
    loadTeamRegistration();
  }

  @override
  void selectRegisteredTeam(RegisteredTeam team) {
    registeredTeamDetails.selectedRegisteredTeam(team);
    var selected = Get.toNamed("/registered-team-details");
    if (selected != null) {
      loadingRegistrations();
    }
  }
}
