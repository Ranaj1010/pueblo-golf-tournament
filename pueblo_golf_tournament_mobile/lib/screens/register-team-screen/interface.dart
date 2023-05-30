import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-tournament-team-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/utilities/enums.dart';

abstract class IRegisterTeamScreenController extends GetxController {
  void registerTeam();
  void addMember();
  void addMemberToTeam(PlayerProfile profile);
  void next();
  void previous();
  void resetForm();
  void goBackToHome();
  void disabledNextWhen();
}
