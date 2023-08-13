import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:pueblo_golf_tournament_mobile/api/authentication/authentication-controller.dart';
import 'package:pueblo_golf_tournament_mobile/api/lookup/lookup-controller.dart';
import 'package:pueblo_golf_tournament_mobile/api/manage/manage-controller.dart';
import 'package:pueblo_golf_tournament_mobile/api/registration/registration-controller.dart';
import 'package:pueblo_golf_tournament_mobile/api/upload/upload-controller.dart';
import 'package:pueblo_golf_tournament_mobile/pages/menu/controller.dart';
import 'package:pueblo_golf_tournament_mobile/screens/home-screen/controller.dart';
import 'package:pueblo_golf_tournament_mobile/screens/update-member-details-screen/controller.dart';

import '../api/setup/setup-controller.dart';
import '../data/context.dart';
import '../pages/dashboard-page/controller.dart';
import '../screens/add-team-member-screen/controller.dart';
import '../screens/add-tournament-schedule-screen/controller.dart';
import '../screens/book-team-schedule/controller.dart';
import '../screens/landing-screen/controller.dart';
import '../screens/manage-schedules-screen/controller.dart';
import '../screens/pay-registration-screen/controller.dart';
import '../screens/register-new-player-screen/controller.dart';
import '../screens/register-team-screen/controller.dart';
import '../screens/registered-team-details-screen/controller.dart';
import '../screens/select-payment-method-screen/controller.dart';
import '../screens/setup-player-profile-screen/controller.dart';
import '../screens/setup-tournament-holes-screen/controller.dart';
import '../screens/sign-in-screen/controller.dart';
import '../screens/sign-up-screen/controller.dart';
import '../screens/tournament-details-screen/controller.dart';
import '../screens/tournaments-screen/controller.dart';
import '../screens/view-team-member-screen/controller.dart';
import '../utilities/http-controller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    // UTILITIES Controllers
    Get.lazyPut(() => HttpController());
    Get.lazyPut(() => DataContextController());

    // API Controllers
    Get.lazyPut(() => AuthenticateController());
    Get.lazyPut(() => RegistrationController());
    Get.lazyPut(() => LookupController());
    Get.lazyPut(() => ManageController());
    Get.lazyPut(() => UploadController());
    Get.lazyPut(() => SetupController());

    // SCREENS Controlllers
    Get.lazyPut(() => LandingScreenController());
    Get.lazyPut(() => SignInScreenController());
    Get.lazyPut(() => HomeScreenController());
    Get.lazyPut(() => SignUpScreenController());
    Get.lazyPut(() => TournamentDetailsScreenController());
    Get.lazyPut(() => RegisterTeamScreenController());
    Get.lazyPut(() => AddTeamMemberScreenController());
    Get.lazyPut(() => RegisterNewPlayerScreenController());
    Get.lazyPut(() => SetupPlayerProfileScreenController());
    Get.lazyPut(() => RegisteredTeamDetailsScreenController());
    Get.lazyPut(() => ViewTeamMemberScreenController());
    Get.lazyPut(() => UpdateMemberDetailsScreenController());
    Get.lazyPut(() => PayRegistrationController());
    Get.lazyPut(() => SelectPaymentMethodController());
    Get.lazyPut(() => TournamentScreenController());
    Get.lazyPut(() => ManageSchedulesScreenController());
    Get.lazyPut(() => AddTournamentScheduleScreenController());
    Get.lazyPut(() => BookTeamScheduleScreenController());
    Get.lazyPut(() => SetupTournamentHolesScreenController());

    // PAGES Controllers
    Get.lazyPut(() => DashboardPageController());
    Get.lazyPut(() => MenuPageController());
  }
}
