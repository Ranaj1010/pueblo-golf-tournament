import 'package:get/get.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/setup-tournament-schedules-request-dto.dart';

abstract class IAddTournamentScheduleScreenController extends GetxController {
  void selectDate(DateTime dateTime);
  void selectTime(TimeSlotDto dateTime);
  void addTimeSlot(TimeSlotDto dateTime);
  void updateTimeSlot(TimeSlotDto previousValue, TimeSlotDto updatedValue);
  void removeTimeSlot(TimeSlotDto dateTime);
  void onChangeTimeSlotAvailability(TimeSlotDto dateTime);
  void initializeTimeSlots();
  void saveSchedule();
}
