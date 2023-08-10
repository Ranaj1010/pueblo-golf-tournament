import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pueblo_golf_tournament_mobile/api/registration/registration-controller.dart';
import 'package:pueblo_golf_tournament_mobile/api/setup/setup-controller.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/tee-time-schedule-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/setup-player-schedules-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/screens/book-team-schedule/interface.dart';
import 'package:pueblo_golf_tournament_mobile/screens/book-team-schedule/widgets.dart';
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
  var selectedDateSchedules = <DateTime>[].obs;
  var selectedScheduleHoleType = <int>[].obs;
  var selectedPlayerProfile = Rxn<PlayerProfile>();
  var selectedPage = Rxn<Widget>();
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
      for (var i = 0; i < response.data!.length; i++) {
        selectedSchedules.add(response.data![i].timeSchedules![0]);
        selectedScheduleHoleType.add(0);
      }

      mountSelectDateSchedules();
    }

    isLoadingSchedules(false);
  }

  @override
  void initialize(PlayerProfile playerProfile) {
    isInitializing(true);
    selectedPlayerProfile(playerProfile);
    teeTimeSchedules.clear();
    selectedDateSchedules.clear();
    selectedScheduleHoleType.clear();
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

    var teeTimeSchedules = <TeeTimeSchedulesRequestDto>[];

    for (var i = 0; i < selectedSchedules.length; i++) {
      teeTimeSchedules.add(TeeTimeSchedulesRequestDto(
          holeType: i, teeTimeSchedule: selectedSchedules[i]));
    }

    try {
      var response = await setupController.setupPlayerSchedules(
          SetupPlayerSchedulesRequestDto(
              tournamentId: registeredTeamDetailsScreenController
                  .registeredTeam.value!.registration.tournamentId,
              playerId: selectedPlayerProfile.value!.player.id,
              teeTimeSchedules: selectedDateSchedules
                  .map((date) => teeTimeSchedules.elementAt(
                      teeTimeSchedules.indexWhere((schedule) =>
                          date ==
                          DateTime(
                              schedule.teeTimeSchedule.dateTimeSlot.year,
                              schedule.teeTimeSchedule.dateTimeSlot.month,
                              schedule.teeTimeSchedule.dateTimeSlot.day))))
                  .toList()));

      if (response.data.isNotEmpty) {
        Get.back();
        Get.snackbar("Booking Success",
            "You have successfully booked your tee time schedules.");
      }

      if (response.data.isEmpty) {
        Get.snackbar("Booking Failed", response.message);
      }
    } catch (e) {
      Get.snackbar("Booking Failed", "Something happened. Please Try again");
    }

    isBookingSchedules(false);
  }

  @override
  void updateHoleType(int index, int value) {
    selectedScheduleHoleType[index] = value;
  }

  @override
  void addToSelectedDateSchedule(DateTime dateTimes) {
    selectedDateSchedules.add(dateTimes);
  }

  @override
  void removeToSelectedDateSchedule(DateTime dateTimes) {
    selectedDateSchedules.remove(dateTimes);
  }

  @override
  void back() {
    mountSelectDateSchedules();
  }

  @override
  void continueBookSchedule() {
    mountSelectTimeSchedules();
  }

  @override
  void mountSelectDateSchedules() {
    selectedPage(Obx(
      () => SelectAvailableDatesWidget(
          onClickContinue: () => continueBookSchedule(),
          addToSelectedDateSchedule: (index) =>
              addToSelectedDateSchedule(index),
          removeToSelectedDateSchedule: (index) =>
              removeToSelectedDateSchedule(index),
          teeTimeSchedules: teeTimeSchedules.value,
          selectedSchedules: selectedSchedules.value,
          selectedDateSchedules: selectedDateSchedules.value),
    ));
  }

  @override
  void mountSelectTimeSchedules() {
    selectedPage(Obx(
      () => PlottingScheduleWidget(
          back: () => back(),
          tabLength: teeTimeSchedules.value.length,
          isBookingSchedules: isBookingSchedules.value,
          isTabBarScrollable: teeTimeSchedules.value.length >= 5,
          bookSchedules: () => bookSchedules(),
          updateHoleType: (index, value) => updateHoleType(index, value),
          selectTimeSlot: (index, value) => selectTimeSlot(index, value),
          teeTimeSchedules: teeTimeSchedules
              .where((element) => selectedDateSchedules.contains(element.date))
              .toList(),
          selectedSchedules: selectedSchedules.value,
          selectedScheduleHoleType: selectedScheduleHoleType.value),
    ));
  }
}
