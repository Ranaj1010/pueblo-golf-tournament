import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:pueblo_golf_tournament_mobile/api/authentication/authentication-controller.dart';
import 'package:pueblo_golf_tournament_mobile/api/lookup/lookup-controller.dart';
import 'package:pueblo_golf_tournament_mobile/api/registration/registration-controller.dart';
import 'package:pueblo_golf_tournament_mobile/api/upload/upload-controller.dart';
import 'package:pueblo_golf_tournament_mobile/pages/menu/controller.dart';
import 'package:pueblo_golf_tournament_mobile/screens/home-screen/controller.dart';

import '../data/context.dart';
import '../pages/dashboard-page/controller.dart';
import '../screens/add-team-member-screen/controller.dart';
import '../screens/landing-screen/controller.dart';
import '../screens/register-new-player-screen/controller.dart';
import '../screens/register-team-screen/controller.dart';
import '../screens/registered-team-details-screen/controller.dart';
import '../screens/setup-player-profile-screen/controller.dart';
import '../screens/sign-in-screen/controller.dart';
import '../screens/sign-up-screen/controller.dart';
import '../screens/tournament-details-screen/controller.dart';
import '../utilities/http-controller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HttpController());
    Get.lazyPut(() => AuthenticateController());
    Get.lazyPut(() => RegistrationController());
    Get.lazyPut(() => LookupController());
    Get.lazyPut(() => UploadController());
    Get.lazyPut(() => LandingScreenController());
    Get.lazyPut(() => SignInScreenController());
    Get.lazyPut(() => HomeScreenController());
    Get.lazyPut(() => DashboardPageController());
    Get.lazyPut(() => SignUpScreenController());
    Get.lazyPut(() => TournamentDetailsScreenController());
    Get.lazyPut(() => RegisterTeamScreenController());
    Get.lazyPut(() => AddTeamMemberScreenController());
    Get.lazyPut(() => RegisterNewPlayerScreenController());
    Get.lazyPut(() => MenuPageController());
    Get.lazyPut(() => DataContextController());
    Get.lazyPut(() => SetupPlayerProfileScreenController());
    Get.lazyPut(() => RegisteredTeamDetailsScreenController());
  }
}
