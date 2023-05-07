import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AccountController extends GetxController {
  // string states
  final email = ''.obs;
  final password = ''.obs;
  final fullName = 'Juan Dela Cruz'.obs;
  final diplayName = 'Juan'.obs;

  // number states
  final loginFailedCounter = 0.obs;

  // on/off states
  final isLoggedIn = false.obs;
  final isPasswordHidden = true.obs;
  final isLoginFailed = false.obs;

  void login(String emailInput, String passwordInput) {
    isLoginFailed(false);
    // handle invalid username or password
    if (emailInput != email.value || passwordInput != password.value) {
      loginFailedCounter(loginFailedCounter.value + 1);
      isLoginFailed(true);
      Get.snackbar("Login Failed", "Invalid email or password");
    }

    // handle successful login
    if (emailInput == email.value && passwordInput == password.value) {
      loginFailedCounter(0);
      isLoginFailed(false);
      isLoggedIn(true);
      Get.offAllNamed('/home');
    }

    // handle login attempts till redirect to reset password
    if (loginFailedCounter.value == 5) {
      // navigate to reset password
      Get.toNamed('/resetPassword');
    }
  }

  void logout() {
    // update states
    loginFailedCounter(0);
    isLoggedIn(false);
    isPasswordHidden(true);
    isLoginFailed(false);
    // navigate to landing page
    Get.offAllNamed('/login');
  }

  void peekPassword() {
    isPasswordHidden(!isPasswordHidden.value);
  }

  void restartResetPassword() {
    loginFailedCounter(0);
  }

  void goToSignUp() {
    Get.toNamed('/account-registration');
  }
}
