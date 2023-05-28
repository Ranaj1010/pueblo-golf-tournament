import 'package:get/get.dart';

abstract class ISignInScreenController extends GetxController {
  void signIn();
  void peekPassword();
  void keepMeSignedIn();
  void forgotPassword();
}
