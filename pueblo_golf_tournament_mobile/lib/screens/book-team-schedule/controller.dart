import 'package:get/get.dart';
import 'package:pueblo_golf_tournament_mobile/api/registration/registration-controller.dart';
import 'package:pueblo_golf_tournament_mobile/api/setup/setup-controller.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/tee-time-schedule-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/setup-player-schedules-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/screens/book-team-schedule/interface.dart';
import 'package:pueblo_golf_tournament_mobile/screens/registered-team-details-screen/controller.dart';
import 'package:pueblo_golf_tournament_mobile/screens/registered-team-details-screen/screen.dart';

import '../../api/lookup/lookup-controller.dart';
import '../../dto/request/lookup-tee-time-schedule-request-dto.dart';
import '../../dto/response/lookup-tee-time-schedules-response-dto.dart';
import '../../dto/response/lookup-tournament-team-response-dto.dart';
import '../tournament-details-screen/controller.dart';

class BookTeamScheduleScreenController
    extends IBookTeamScheduleScreenController {
  var teeTimeSchedules = <TournamentScheduleDate>[].obs;
  var selectedSchedules = <TeeTimeScheduleDto>[].obs;
  var selectedPlayerProfile = Rxn<PlayerProfile>();
  var isLoadingSchedules = false.obs;
  var isBookingSchedules = false.obs;
  var isInitializing = false.obs;
  final lookupController = Get.find<LookupController>();
  final setupController = Get.find<SetupController>();
  final tournamentDetailsController =
      Get.find<TournamentDetailsScreenController>();
  final registeredTeamDetailsScreenController =
      Get.find<RegisteredTeamDetailsScreenController>();
  @override
  void loadTeamSchedules() async {
    teeTimeSchedules.clear();
    isLoadingSchedules(true);
    var response = await lookupController.lookupTeeTimeSchedules(
        LookupTeeTimeScheduleRequest(
            tournamentId:
                tournamentDetailsController.selectedTournament.value!.id));
    if (response.data != null) {
      teeTimeSchedules.addAll(response.data!);
      for (var schedule in response.data!) {
        selectedSchedules.add(schedule.timeSchedules![0]);
      }
    }
    isLoadingSchedules(false);
  }

  @override
  void initialize(PlayerProfile playerProfile) {
    selectedPlayerProfile(playerProfile);
    isInitializing(true);
    loadTeamSchedules();
    isInitializing(false);
  }

  @override
  void selectTimeSlot(int index, TeeTimeScheduleDto scheduleDto) {
    selectedSchedules[index] = scheduleDto;
  }

  @override
  void bookSchedules() async {
    isBookingSchedules(true);
    var response = await setupController.setupPlayerSchedules(
        SetupPlayerSchedulesRequestDto(
            playerId: selectedPlayerProfile.value!.player.id,
            teeTimeSchedules: selectedSchedules));

    if (response.message.isNotEmpty) {
      Get.back();
      Get.snackbar("Booking Success",
          "You have successfully booked your tee time schedules.");
    }

    if (response.message.isNotEmpty) {
      Get.snackbar("Booking Failed",
          "Failed to book your schedules. Please try again later.");
    }
    isBookingSchedules(false);
  }
}
