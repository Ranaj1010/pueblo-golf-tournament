import 'package:get/get.dart';

abstract class ISignUpScreenController extends GetxController {
  void signUp();
  void signInNow();
  void peekPassword();
  void peekConfirmPassword();
  void next();
  void previous();
}
