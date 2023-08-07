import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/tee-time-schedule-dto.dart';

abstract class IManageSchedulesScreenController extends GetxController {
  void initialize();
  void loadSchedules(int tournamentId);
  void addSchedule();
  void updateSchedule(int dateIndex, TeeTimeScheduleDto schedule);
}
