import 'package:get/get.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-tournament-team-response-dto.dart';

import '../../dto/response/lookup-tee-time-schedules-response-dto.dart';

abstract class IViewTeamMemberScreenController extends GetxController {
  void goBack();
  void edit();
  void editProfile(PlayerProfile profile);
  void initialize(PlayerProfile profile);
  void goToTeeTime(TournamentScheduleDate schedule);
  void loadScheduls();
}
