import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:pueblo_golf_tournament_mobile/api/lookup/lookup-controller.dart';
import 'package:pueblo_golf_tournament_mobile/api/save/save-controller.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/player-tee-time-schedule-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/tournament-hole-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/tournament-player-score-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/lookup-player-scores-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/lookup-tournament-details-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/save-tournament-player-score-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-tee-time-schedules-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/screens/tee-time-screen/interface.dart';
import 'package:pueblo_golf_tournament_mobile/screens/view-team-member-screen/controller.dart';
import 'package:pueblo_golf_tournament_mobile/utilities/enums.dart';
import 'package:pueblo_golf_tournament_mobile/widgets/brand-elevated-button.dart';

import '../registered-team-details-screen/controller.dart';

class TeeTimeScreenController extends ITeeTimeScreenController {
  var tournamentScheduleDate = Rxn<TournamentScheduleDate>();
  var tournamentHoles = <TournamentHoleDto>[].obs;
  var isLoadingScores = false.obs;
  var isSavingNewScore = false.obs;
  var tournamentPlayerScores = <TournamentPlayerScoreDto>[].obs;
  var holeNumberTextController = TextEditingController();
  var strokeTextController = TextEditingController();
  final scoringFormKey = GlobalKey<FormState>();
  final lookupController = Get.find<LookupController>();
  final saveController = Get.find<SaveController>();
  final registeredTeamScreenController =
      Get.find<RegisteredTeamDetailsScreenController>();
  final viewTeamMemberScreenController =
      Get.find<ViewTeamMemberScreenController>();
  @override
  void loadScores() async {
    isLoadingScores(true);
    try {
      for (var timr in tournamentScheduleDate.value!.timeSchedules!) {
        print(timr.id);
      }
      tournamentPlayerScores.clear();
      var response = await lookupController.lookupPlayerScores(
          LookupPlayerScoresRequest(
              tournamentId: registeredTeamScreenController
                  .registeredTeam.value!.registration.tournamentId,
              playerId:
                  viewTeamMemberScreenController.playerProfile.value!.player.id,
              teamId:
                  registeredTeamScreenController.registeredTeam.value!.team.id,
              teeTimeScheduleId:
                  tournamentScheduleDate.value!.timeSchedules!.first.id));

      if (response.data.isNotEmpty) {
        tournamentPlayerScores.addAll(response.data);
      }
    } catch (e) {
      Get.snackbar("Failed to load Scores",
          "Something went wrong. Please try again later");
    }

    isLoadingScores(false);
  }

  @override
  void saveScore() async {
    if (scoringFormKey.currentState!.validate()) {
      isSavingNewScore(true);

      try {
        var index = tournamentHoles.indexWhere((element) =>
            element.holeNumber == int.parse(holeNumberTextController.text));
        var tournamentHole = tournamentHoles.elementAt(index);
        var response = await saveController.savedTournamentPlayerScore(
            SaveTournamentPlayerScoreRequestDto(
                tournamentId: registeredTeamScreenController
                    .registeredTeam.value!.registration.tournamentId,
                playerId: viewTeamMemberScreenController
                    .playerProfile.value!.player.id,
                teamId: registeredTeamScreenController
                    .registeredTeam.value!.team.id,
                registrationId: registeredTeamScreenController
                    .registeredTeam.value!.registration.id,
                tournamentHoleId: tournamentHole.id,
                teeTimeScheduleId:
                    tournamentScheduleDate.value!.timeSchedules!.first.id,
                actualStrokes: int.parse(strokeTextController.text),
                scorerId: 0));
        if (response.data != null) {
          Get.back();
          loadScores();
          Get.snackbar("Success", response.message);
        }

        if (response.data == null) {
          Get.back();
          Get.snackbar("Failed", response.message);
        }
      } catch (e) {
        Get.snackbar("Failed", "Something went wrong. Please try again.");
      }

      isSavingNewScore(false);
    }
  }

  @override
  void initializeTeeTime(TournamentScheduleDate scheduleDate) {
    tournamentScheduleDate(scheduleDate);
    loadHoles();
    loadScores();
  }

  @override
  void addScore() {
    Get.bottomSheet(
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Wrap(
            runSpacing: 30,
            children: [
              const Text(
                "New Score",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Form(
                key: scoringFormKey,
                child: Wrap(
                  runSpacing: 10,
                  children: [
                    TextFormField(
                      controller: holeNumberTextController,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(hintText: "Enter Hole"),
                      validator: (value) {
                        var index = tournamentHoles.indexWhere((element) =>
                            element.holeNumber == int.parse(value!));
                        if (index < 0) {
                          return "Unknown Hole Number.";
                        }

                        if (value == null || value.isEmpty) {
                          return 'This field is required.';
                        }

                        return null;
                      },
                    ),
                    TextFormField(
                      controller: strokeTextController,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      keyboardType: TextInputType.number,
                      decoration:
                          const InputDecoration(hintText: "Enter Stroke"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required.';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        width: 150,
                        child: TextButton(
                          onPressed: () => {},
                          child: const Text("Cancel"),
                        )),
                    SizedBox(
                      width: 150,
                      child: BrandElevatedButton(
                          onPressed: () => saveScore(),
                          title: "Save",
                          loading: false),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        backgroundColor: Colors.white,
        isDismissible: false);
  }

  @override
  void loadHoles() async {
    tournamentHoles.clear();
    var response = await lookupController.lookupTournamentHoles(
        LookupTournamentDetailsRequestDto(
            tournamentId: registeredTeamScreenController
                .registeredTeam.value!.registration.tournamentId));

    if (response.data.isNotEmpty) {
      tournamentHoles.addAll(response.data);
    }
  }
}
