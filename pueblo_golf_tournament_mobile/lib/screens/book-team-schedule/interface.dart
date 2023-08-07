import 'package:get/get.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/tee-time-schedule-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-tee-time-schedules-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-tournament-team-response-dto.dart';

abstract class IBookTeamScheduleScreenController extends GetxController {
  void loadTeamSchedules();
  void initialize(PlayerProfile playerProfile);
  void selectTimeSlot(int index, TeeTimeScheduleDto scheduleDto);
  void bookSchedules();
}
