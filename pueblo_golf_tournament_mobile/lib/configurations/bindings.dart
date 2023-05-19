import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:pueblo_golf_tournament_mobile/api/service/lookup-controller.dart';
import 'package:pueblo_golf_tournament_mobile/controllers/pages/dashboard-page-controller.dart';
import 'package:pueblo_golf_tournament_mobile/controllers/screens/add-member-screen-controller.dart';
import 'package:pueblo_golf_tournament_mobile/controllers/screens/home-screen-controller.dart';
import 'package:pueblo_golf_tournament_mobile/controllers/screens/landing-screen-controller.dart';
import 'package:pueblo_golf_tournament_mobile/controllers/screens/register-team-screen-controller.dart';
import 'package:pueblo_golf_tournament_mobile/controllers/screens/registration-screen-controller.dart';
import 'package:pueblo_golf_tournament_mobile/controllers/screens/registration-success-screen-controller.dart';
import 'package:pueblo_golf_tournament_mobile/controllers/screens/tournament-details-screen-controller.dart';
import 'package:pueblo_golf_tournament_mobile/controllers/services/http-controllers.dart';

import '../api/service/authentication-controller.dart';
import '../api/service/registration-controller.dart';
import '../controllers/screens/login-screen-controller.dart';
import '../controllers/screens/register-team-success-screen-controller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HttpServiceController());
    Get.lazyPut(() => LandingScreenController());
    Get.lazyPut(() => LoginScreenController());
    Get.lazyPut(() => AuthenticationController());
    Get.lazyPut(() => RegistrationController());
    Get.lazyPut(() => RegistrationSuccessScreenController());
    Get.lazyPut(() => RegistrationScreenController());
    Get.lazyPut(() => HomeScreenController());
    Get.lazyPut(() => DashboardPageController());
    Get.lazyPut(() => LookupController());
    Get.lazyPut(() => TournamentDetailsScreenController());
    Get.lazyPut(() => RegisterTeamScreenController());
    Get.lazyPut(() => AddMemberScreenController());
    Get.lazyPut(() => RegistrationTeamSuccessScreenController());
  }
}
