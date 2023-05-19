import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  var selectedPage = 0.obs;

  void signOut() {
    Get.offAllNamed("/");
  }

  selectPage(int index) {
    selectedPage(index);
  }
}
