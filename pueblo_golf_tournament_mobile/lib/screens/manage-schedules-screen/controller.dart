import 'package:get/get.dart';
import 'package:pueblo_golf_tournament_mobile/api/lookup/lookup-controller.dart';
import 'package:pueblo_golf_tournament_mobile/api/manage/manage-controller.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/tee-time-schedule-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/lookup-tee-time-schedule-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/update-tee-time-schedule-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/screens/manage-schedules-screen/interface.dart';
import 'package:pueblo_golf_tournament_mobile/screens/tournament-details-screen/controller.dart';
import 'package:pueblo_golf_tournament_mobile/screens/tournament-details-screen/screen.dart';

import '../../dto/response/lookup-tee-time-schedules-response-dto.dart';

class ManageSchedulesScreenController extends IManageSchedulesScreenController {
  var dateSchedules = <TeeTimeScheduleDto>[].obs;
  var teeTimeSchedules = <TournamentScheduleDate>[].obs;
  var isLoadingSchedules = false.obs;
  final lookupController = Get.find<LookupController>();
  final manageController = Get.find<ManageController>();
  final tournamentDetailsController =
      Get.find<TournamentDetailsScreenController>();

  @override
  void loadSchedules(int tournamentId) async {
    teeTimeSchedules.clear();
    isLoadingSchedules(true);
    var response = await lookupController.lookupTeeTimeSchedules(
        LookupTeeTimeScheduleRequest(tournamentId: tournamentId));
    if (response.data != null) {
      teeTimeSchedules.addAll(response.data!);
    }
    isLoadingSchedules(false);
  }

  @override
  void addSchedule() async {
    var added = await Get.toNamed("/add-tournament-schedule");
    if (added != null) {
      initialize();
    }
  }

  @override
  void initialize() {
    loadSchedules(tournamentDetailsController.selectedTournament.value!.id);
  }

  @override
  void updateSchedule(int dateIndex, TeeTimeScheduleDto schedule) async {
    var response = await manageController.updateTeeTimeSchedule(
        UpdateTeeTimeScheduleRequestDto(teeTimeSchedule: schedule));
    if (response.data != null) {
      var currentDateValue = teeTimeSchedules.elementAt(dateIndex);
      var currentTeeTimeScheduleIndex = currentDateValue.timeSchedules!
          .indexWhere((element) => element.id == schedule.id);
      currentDateValue.timeSchedules![currentTeeTimeScheduleIndex] = schedule;
      teeTimeSchedules[dateIndex] = currentDateValue;
    }
  }
}
