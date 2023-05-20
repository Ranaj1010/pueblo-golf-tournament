import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:pueblo_golf_tournament_web/api/service/http-controller.dart';

import '../api/lookups/controller.dart';
import '../pages/tournaments-page/controller.dart';
import '../screens/home-screen/controller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeScreenController());
    Get.lazyPut(() => HttpServiceController());
    Get.lazyPut(() => LookupController());
    Get.lazyPut(() => TournamentsScreenController());
  }
}
