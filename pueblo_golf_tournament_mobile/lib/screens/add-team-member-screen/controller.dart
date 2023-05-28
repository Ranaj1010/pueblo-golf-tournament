import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pueblo_golf_tournament_mobile/api/lookup/lookup-controller.dart';
import 'package:pueblo_golf_tournament_mobile/data/context.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/lookup-player-profile-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/screens/add-team-member-screen/interface.dart';
import 'package:pueblo_golf_tournament_mobile/screens/register-team-screen/controller.dart';

class AddTeamMemberScreenController extends IAddTeamMemberScreenController {
  var playerIdTextController = TextEditingController();
  var isAddingMember = false.obs;
  var isPlayerNotFound = false.obs;
  final lookupController = Get.find<LookupController>();
  final registerTeamScreenController = Get.find<RegisterTeamScreenController>();
  final dataContextController = Get.find<DataContextController>();

  @override
  void registerNewPlayer() {
    Get.toNamed("/register-player");
  }

  @override
  void searchPlayerId() async {
    isAddingMember(true);

    if (playerIdTextController.text ==
        dataContextController.playerProfile.value!.player.playerExternalId) {
      Get.snackbar("Player is invalid",
          "Please enter another Player ID other than yours.");
    }

    var existingMember = registerTeamScreenController.members.where((element) =>
        element.player.playerExternalId == playerIdTextController.text);

    if (registerTeamScreenController.members.isNotEmpty) {
      if (existingMember.isNotEmpty) {
        Get.snackbar(
            "Player already exists.", "Please enter another Player ID");
      }
    }

    if (playerIdTextController.text !=
            dataContextController
                .playerProfile.value!.player.playerExternalId &&
        existingMember.isEmpty) {
      var response = await lookupController.lookupPlayerProfile(
          LookupPlayeProfileRequestDto(
              playerExternalId: playerIdTextController.text));
      if (response.profile?.player == null) {
        Get.snackbar("Player not found", "Please try again");
        isPlayerNotFound(true);
      }

      if (response.profile?.player != null) {
        Get.back(result: response.profile);
      }
    }

    isAddingMember(false);
  }

  @override
  void autoEncodeCreatedPlayer(String playerIdNumber) {
    playerIdTextController.text = playerIdNumber;
    update();
  }
}
