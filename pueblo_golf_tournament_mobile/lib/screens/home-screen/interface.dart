import 'package:get/get.dart';

abstract class IHomeScreenScreenController extends GetxController {
  void signOut();
  void selectPage(int index);
  void viewNotifications();
  void initializePlayerProfile();
}
