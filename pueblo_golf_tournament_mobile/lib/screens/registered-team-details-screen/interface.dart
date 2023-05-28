import 'package:get/get.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-tournament-team-response-dto.dart';

abstract class IRegisteredTeamDetailsScreenControler extends GetxController {
  void goBack();
  void selectedRegisteredTeam(RegisteredTeam team);
}
