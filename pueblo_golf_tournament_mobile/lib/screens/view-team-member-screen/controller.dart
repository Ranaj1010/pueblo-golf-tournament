import 'dart:convert';

import 'package:get/get.dart';
import 'package:pueblo_golf_tournament_mobile/api/lookup/lookup-controller.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-tournament-team-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/screens/tee-time-screen/screen.dart';
import 'package:pueblo_golf_tournament_mobile/screens/update-member-details-screen/controller.dart';
import 'package:pueblo_golf_tournament_mobile/screens/view-team-member-screen/interface.dart';

import '../../dto/request/lookup-player-tee-time-schedule-request-dto.dart';
import '../../dto/response/lookup-tee-time-schedules-response-dto.dart';
import '../registered-team-details-screen/controller.dart';

class ViewTeamMemberScreenController extends IViewTeamMemberScreenController {
  final registeredTeamScreenController =
      Get.find<RegisteredTeamDetailsScreenController>();
  final updateTeamMemberDetailsScreenController =
      Get.find<UpdateMemberDetailsScreenController>();
  final lookupController = Get.find<LookupController>();
  var playerProfile = Rxn<PlayerProfile>();
  var isLoadingSchedules = false.obs;
  var playerSchedules = <TournamentScheduleDate>[].obs;
  var selectedTournamentScheduleDate = Rxn<TournamentScheduleDate>();

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

  @override
  void initialize(PlayerProfile profile) {
    // TODO: implement initialize
    playerProfile(profile);
    loadScheduls();
  }

  @override
  void loadScheduls() async {
    playerSchedules.clear();

    var response = await lookupController
        .lookupPlayerTeeTimeSchedules(LookupPlayerTeeTimeScheduleRequest(
      tournamentId: registeredTeamScreenController
          .registeredTeam.value!.registration.tournamentId,
      playerId: playerProfile.value!.player.id,
    ));

    if (response.data!.isNotEmpty) {
      playerSchedules.addAll(response.data!);
    }
  }

  @override
  void goToTeeTime(TournamentScheduleDate schedule) {
    selectedTournamentScheduleDate(schedule);
    Get.toNamed("/tee-time");
  }
}
