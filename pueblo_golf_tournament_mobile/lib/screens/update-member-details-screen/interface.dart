import 'package:get/get.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-tournament-team-response-dto.dart';

abstract class IUpdateMemberDetailScreenController extends GetxController {
  void updatePlayerProfile();
  void loadProfile(PlayerProfile profile);
  void goBack();
  void next();
  void previous();
}
