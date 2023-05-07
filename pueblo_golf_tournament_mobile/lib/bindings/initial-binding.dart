import 'package:get/instance_manager.dart';
import 'package:injector/injector.dart';
import 'package:pueblo_golf_tournament_mobile/controllers/http-service-controller.dart';
import 'package:pueblo_golf_tournament_mobile/controllers/registration-controller.dart';

import '../controllers/account-controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AccountController());
    Get.lazyPut(() => RegistrationController());
    Get.lazyPut(() => HttpServiceController());
  }
}
