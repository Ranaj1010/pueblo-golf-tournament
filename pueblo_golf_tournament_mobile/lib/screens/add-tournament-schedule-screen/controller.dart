import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:pueblo_golf_tournament_mobile/api/setup/setup-controller.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/setup-tournament-schedules-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/screens/add-tournament-schedule-screen/interface.dart';
import 'package:pueblo_golf_tournament_mobile/screens/tournament-details-screen/controller.dart';

class AddTournamentScheduleScreenController
    extends IAddTournamentScheduleScreenController {
  var selectedTime = Rxn<TimeOfDay?>();
  var selectedDate = Rxn<DateTime>();
  var timeSlots = <TimeSlotDto>[].obs;
  var setupController = Get.find<SetupController>();
  var tournamentDetailsController =
      Get.find<TournamentDetailsScreenController>();

  @override
  void onInit() {
    super.onInit();
    selectedDate(DateTime.now());
    selectedTime(TimeOfDay.now());
    initializeTimeSlots();
  }

  @override
  void selectDate(DateTime dateTime) {
    selectedDate(dateTime);
  }

  @override
  void initializeTimeSlots() {
    timeSlots.clear();
  }

  @override
  void saveSchedule() async {
    if (timeSlots.isEmpty) {
      Get.snackbar(
          "Time slots are empty", "Please pick time slots and try again.");
    }

    if (timeSlots.isNotEmpty) {
      var timeSeries = timeSlots
          .map((element) => TimeSlotDto(
              timeSeriesSlot: element.timeSeriesSlot,
              isEnabled: element.isEnabled,
              isSelected: element.isSelected))
          .toList();

      var response = await setupController.setupTournamentSchedules(
          SetupTournamentSchedulesRequestDto(
              tournamentId:
                  tournamentDetailsController.selectedTournament.value!.id,
              schedules: [
            ScheduleDto(date: selectedDate.value!, timeSeries: timeSeries)
          ]));

      if (response.success) {
        initializeTimeSlots();
        Get.back(result: true);
        Get.snackbar("Success", response.message);
      }

      if (!response.success) {
        Get.snackbar("Failed", response.message);
      }
    }
  }

  @override
  void selectTime(TimeSlotDto dateTime) {}

  @override
  void addTimeSlot(TimeSlotDto dateTime) {
    timeSlots.add(dateTime);
  }

  @override
  void onChangeTimeSlotAvailability(TimeSlotDto dateTime) {
    var currentValueIndex = timeSlots.indexWhere(
        (element) => element.timeSeriesSlot == dateTime.timeSeriesSlot);
    var currentValue = timeSlots.elementAt(currentValueIndex);

    var newValue = TimeSlotDto(
        timeSeriesSlot: currentValue.timeSeriesSlot,
        isEnabled: !currentValue.isEnabled,
        isSelected: false);

    timeSlots[currentValueIndex] = newValue;
  }

  @override
  void removeTimeSlot(TimeSlotDto dateTime) {
    timeSlots.remove(dateTime);
  }

  @override
  void updateTimeSlot(TimeSlotDto previousValue, TimeSlotDto updatedValue) {
    var currentValueIndex = timeSlots.indexWhere(
        (element) => element.timeSeriesSlot == previousValue.timeSeriesSlot);
    var currentValue = timeSlots.elementAt(currentValueIndex);

    var newValue = TimeSlotDto(
        timeSeriesSlot: updatedValue.timeSeriesSlot,
        isEnabled: currentValue.isEnabled,
        isSelected: true);

    timeSlots[currentValueIndex] = newValue;
  }
}
