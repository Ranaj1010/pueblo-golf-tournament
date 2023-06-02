import 'dart:convert';

import 'package:get/get.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-tournament-team-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/screens/update-member-details-screen/controller.dart';
import 'package:pueblo_golf_tournament_mobile/screens/view-team-member-screen/interface.dart';

import '../registered-team-details-screen/controller.dart';

class ViewTeamMemberScreenController extends IViewTeamMemberScreenController {
  final registeredTeamScreenController =
      Get.find<RegisteredTeamDetailsScreenController>();
  final updateTeamMemberDetailsScreenController =
      Get.find<UpdateMemberDetailsScreenController>();
  @override
  void edit() {
    // TODO: implement edit
  }

  @override
  void goBack() {
    // TODO: implement goBack
  }

  @override
  void editProfile(PlayerProfile profile) async {
    updateTeamMemberDetailsScreenController.loadProfile(profile);
    var editPage = await Get.toNamed("/update-profile");
    if (editPage != null) {
      var profile = PlayerProfile.fromJson(jsonDecode(jsonEncode(editPage)));
      registeredTeamScreenController.selectedMember(profile);
    }
  }
}
