import 'package:get/get.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/authenticate-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-tournament-team-response-dto.dart';

abstract class IDataContextController extends GetxController {
  void saveAuthenticatedUserData(AuthenticatedUserData data);
  void saveAuthentictedPlayerProfile(PlayerProfile profile);
  void signOut();
}
