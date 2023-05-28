import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pueblo_golf_tournament_mobile/api/registration/registration-controller.dart';
import 'package:pueblo_golf_tournament_mobile/data/context.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/register-player-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/screens/setup-player-profile-screen/interface.dart';
import 'package:pueblo_golf_tournament_mobile/screens/setup-player-profile-screen/widgets.dart';

class SetupPlayerProfileScreenController
    extends ISetupPlayerProfileScreenController {
  var homeClubTextController = TextEditingController();
  var worldHandicapSystemIdTextController = TextEditingController();
  var selectedFormIndex = 0.obs;
  var forms = [];
  var formTitles = ["Setup your Player Profile", "Congratulations"];
  final registrationController = Get.find<RegistrationController>();
  final dataContextController = Get.find<DataContextController>();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    forms = [
      PlayerForm(
          homeClubTextController: homeClubTextController,
          worldHandicapSystemIdTextController:
              worldHandicapSystemIdTextController),
      SetupProfileSuccess()
    ];
  }

  @override
  void back() {
    homeClubTextController.clear();
    worldHandicapSystemIdTextController.clear();
    Get.back();
  }

  @override
  void saveProfile() async {
    var response = await registrationController.registerPlayer(
        RegisterPlayerRequestDto(
            worldHandicapSystemId: worldHandicapSystemIdTextController.text,
            homeClub: homeClubTextController.text,
            personId: dataContextController
                .authenticatedData.value!.personalDetails!.id));

    if (response.playerProfile == null) {
      Get.snackbar("Setup failed.", "Please try again");
    }

    if (response.playerProfile != null) {
      dataContextController
          .saveAuthentictedPlayerProfile(response.playerProfile!);
      selectedFormIndex(++selectedFormIndex.value);
    }
  }
}
