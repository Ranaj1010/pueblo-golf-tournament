import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:pueblo_golf_tournament_mobile/data/interface.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/authenticate-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-tournament-team-response-dto.dart';

import '../utilities/signalr-controller.dart';

class DataContextController extends IDataContextController {
  var authenticatedData = Rxn<AuthenticatedUserData?>();
  var playerProfile = Rxn<PlayerProfile?>();

  @override
  void saveAuthenticatedUserData(AuthenticatedUserData data) {
    authenticatedData(data);
  }

  @override
  void saveAuthentictedPlayerProfile(PlayerProfile profile) {
    playerProfile(profile);
  }

  @override
  void signOut() {
    authenticatedData(null);
    playerProfile(null);
  }
}
