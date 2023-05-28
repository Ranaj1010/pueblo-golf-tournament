import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pueblo_golf_tournament_mobile/data/context.dart';
import 'package:pueblo_golf_tournament_mobile/pages/menu/interface.dart';

class MenuPageController extends IMenuPageController {
  final dataContextController = Get.find<DataContextController>();
  @override
  void signOut() {
    Get.offAllNamed("/");
    dataContextController.signOut();
  }
}
