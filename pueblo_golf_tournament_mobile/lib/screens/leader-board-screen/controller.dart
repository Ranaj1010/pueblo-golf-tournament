import 'dart:convert';

import 'package:get/get.dart';
import 'package:pueblo_golf_tournament_mobile/api/lookup/lookup-controller.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/division-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/leader-board-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/lookup-leader-board-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-leader-board-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/screens/leader-board-screen/interface.dart';
import 'package:pueblo_golf_tournament_mobile/screens/tournament-details-screen/controller.dart';

import '../../dto/request/lookup-division-request-dto.dart';

class LeaderBoardScreenController extends ILeaderBoardScreenController {
  var isInitializing = false.obs;
  var isLoadingLeaderBoard = false.obs;
  var selectedDivision = Rxn<DivisionDto>();
  var divisions = <DivisionDto>[].obs;
  var leaderBoard = <DivisionLeaderBoard>[].obs;

  final lookupController = Get.find<LookupController>();
  final tournamentDetailsController =
      Get.find<TournamentDetailsScreenController>();

  @override
  void initialize() async {
    isInitializing(true);
    await loadDivisions();
    isInitializing(false);
  }

  @override
  Future<void> loadLeaderBoard() async {
    isLoadingLeaderBoard(true);
    leaderBoard.clear();
    var response = await lookupController.lookupLeaderBoard(
        LookupLeaderBoardRequestDto(
            tournamentId:
                tournamentDetailsController.selectedTournament.value!.id));

    if (response.data.isNotEmpty) {
      leaderBoard.addAll(response.data);
    }

    isLoadingLeaderBoard(false);
  }

  @override
  void updateLeaderBoard(List<DivisionLeaderBoard> data) {
    print("updating leader board..");
    leaderBoard.clear();
    leaderBoard.addAll(data);
    print("leader board updated");
    print(jsonEncode(leaderBoard));
  }

  @override
  Future<void> loadDivisions() async {
    var response = await lookupController.lookupDivisions(
        LookupDivisionRequestDto(
            filterName: "",
            tournamentId:
                tournamentDetailsController.selectedTournament.value!.id));

    if (response.data!.isNotEmpty) {
      divisions.addAll(response.data!);
      selectedDivision(response.data!.first);
      await loadLeaderBoard();
    }
  }
}
