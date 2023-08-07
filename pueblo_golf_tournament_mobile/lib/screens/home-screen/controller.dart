import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pueblo_golf_tournament_mobile/api/lookup/lookup-controller.dart';
import 'package:pueblo_golf_tournament_mobile/data/context.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/tournament-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/lookup-player-profile-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/pages/dashboard-page/page.dart';
import 'package:pueblo_golf_tournament_mobile/pages/history-page/page.dart';
import 'package:pueblo_golf_tournament_mobile/pages/menu/page.dart';
import 'package:pueblo_golf_tournament_mobile/pages/my-teams-page/page.dart';
import 'package:pueblo_golf_tournament_mobile/pages/schedules-page/page.dart';
import 'package:pueblo_golf_tournament_mobile/pages/score-board-page/page.dart';
import 'package:pueblo_golf_tournament_mobile/screens/home-screen/interface.dart';

class HomeScreenController extends IHomeScreenScreenController {
  var selectedPageIndex = 0.obs;
  var pages = [DashboardPage(), MyTeamsPage(), HistoryPage(), MenuPage()];
  var pagesTitle = ["Home", "My Teams", "History", "Menu"];
  final lookupController = Get.find<LookupController>();
  final dataContextController = Get.find<DataContextController>();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void selectPage(int index) {
    selectedPageIndex(index);
  }

  @override
  void signOut() {
    selectedPageIndex(0);
    Get.offAllNamed("/signin");
  }

  @override
  void viewNotifications() {
    // TODO: implement viewNotifications
  }

  @override
  void initializePlayerProfile() async {
    if (dataContextController.authenticatedData.value != null) {
      var response = await lookupController.lookupPlayerProfileByPersonId(
          LookupPlayeProfileByPersonIdRequestDto(
              personId: dataContextController
                  .authenticatedData.value!.personalDetails!.id));

      if (response.profile == null &&
          dataContextController.authenticatedData.value!.account!.accountType ==
              2) {
        print(dataContextController
            .authenticatedData.value!.account!.accountType);
        Get.toNamed("/setup-player-profile");
      }

      if (response.profile != null && response.profile!.player != null) {
        dataContextController.saveAuthentictedPlayerProfile(response.profile!);
      }
    }
  }
}
