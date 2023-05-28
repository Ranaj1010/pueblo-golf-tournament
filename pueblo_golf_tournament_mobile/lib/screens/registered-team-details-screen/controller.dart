import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-tournament-team-response-dto.dart';

import 'interface.dart';

class RegisteredTeamDetailsScreenController
    extends IRegisteredTeamDetailsScreenControler {
  var registeredTeam = Rxn<RegisteredTeam>();

  @override
  void goBack() {
    Get.back();
  }

  @override
  void selectedRegisteredTeam(RegisteredTeam team) {
    registeredTeam(team);
  }
}
