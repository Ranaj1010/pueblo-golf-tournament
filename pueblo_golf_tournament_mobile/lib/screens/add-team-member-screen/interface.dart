import 'package:get/get.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/tournament-dto.dart';

abstract class IAddTeamMemberScreenController extends GetxController {
  void searchPlayerId();
  void autoEncodeCreatedPlayer(String playerIdNumber);
  void registerNewPlayer();
}
