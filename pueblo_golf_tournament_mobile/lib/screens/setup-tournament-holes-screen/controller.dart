import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pueblo_golf_tournament_mobile/api/lookup/lookup-controller.dart';
import 'package:pueblo_golf_tournament_mobile/api/setup/setup-controller.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/tournament-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/lookup-tournament-details-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/screens/setup-tournament-holes-screen/interface.dart';

import '../../dto/request/setup-tournament-holes-request-dto.dart';
import '../tournament-details-screen/controller.dart';

class SetupTournamentHolesScreenController
    extends ISetupTournamentHolesScreenController {
  var holes = <HoleRequestDto>[].obs;
  var isSavingHoles = false.obs;
  var isAlreadyConfigured = false.obs;
  final tournamentDetailsController =
      Get.find<TournamentDetailsScreenController>();
  final setupController = Get.find<SetupController>();
  final lookupController = Get.find<LookupController>();
  final formKey = GlobalKey<FormState>();
  @override
  void loadEighteenHoles() async {
    holes.clear();

    var response = await lookupController.lookupTournamentHoles(
        LookupTournamentDetailsRequestDto(
            tournamentId:
                tournamentDetailsController.selectedTournament.value!.id));

    if (response.data.isNotEmpty) {
      isAlreadyConfigured(true);
      for (var hole in response.data) {
        holes.add(HoleRequestDto(
            holeNumber: hole.holeNumber, maximumStrokes: hole.maximumStrokes));
      }
    }

    if (response.data.isEmpty) {
      for (var i = 1; i < 19; i++) {
        holes.add(HoleRequestDto(holeNumber: i, maximumStrokes: 0));
      }
      isAlreadyConfigured(false);
    }
  }

  @override
  void saveHoles() async {
    if (formKey.currentState!.validate()) {
      isSavingHoles(true);
      try {
        var response = await setupController.setupTournamentHoles(
            SetupTournamentHolesRequestDto(
                tournamentId:
                    tournamentDetailsController.selectedTournament.value!.id,
                holes: holes));

        if (response.data.isNotEmpty) {
          Get.back();
          Get.snackbar("Success",
              "You have successfully assign holes for this tournament.");
        }

        if (response.data.isEmpty) {
          Get.snackbar("Failed", response.message);
        }
      } catch (e) {
        Get.snackbar("Failed", "Something went wrong. Please try again later");
      }
      isSavingHoles(false);
    }
  }

  @override
  void updateMaximumHole(int index, int value) {
    holes[index] = HoleRequestDto(
        holeNumber: holes.elementAt(index).holeNumber, maximumStrokes: value);
  }

  @override
  void initialize() {
    loadEighteenHoles();
  }
}
