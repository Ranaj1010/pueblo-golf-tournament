import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pueblo_golf_tournament_mobile/api/lookup/lookup-controller.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/lookup-tournaments-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/pages/dashboard-page/interface.dart';
import 'package:pueblo_golf_tournament_mobile/screens/tournament-details-screen/controller.dart';

import '../../dto/model/tournament-dto.dart';

class DashboardPageController extends IDashboardPageController {
  var tournaments = <TournamentDto>[].obs;
  var searchTextController = TextEditingController();
  var isLoadingTournaments = false.obs;
  final lookupController = Get.find<LookupController>();
  final tournamentDetailsController =
      Get.find<TournamentDetailsScreenController>();
  @override
  void onInit() {
    super.onInit();
    loadTournaments();
  }

  @override
  void loadTournaments() async {
    isLoadingTournaments(true);
    var data = await lookupController
        .lookupTournaments(LookupTournamentsRequestDto(filterName: ""));
    tournaments(data.data);
    isLoadingTournaments(false);
  }

  @override
  void searchTournament() {
    // TODO: implement searchTournament
  }

  @override
  void viewMoreTournaments() {
    // TODO: implement viewMoreTournaments
  }
  @override
  void selectTournament(TournamentDto tournament) {
    tournamentDetailsController.selectTournament(tournament);

    Get.toNamed("/tournament-details");
  }
}
