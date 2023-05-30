import 'package:get/get.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-tournament-team-response-dto.dart';

abstract class IUpdateTeamDetailsScreenController extends GetxController {
  void uploadTeamLogo();
  void saveTeamDetails();
  void updateTeamMember(PlayerProfile member);
  void openEditScreenForTeamMember(PlayerProfile member);
  void deleteTeamMember(PlayerProfile member);
}
