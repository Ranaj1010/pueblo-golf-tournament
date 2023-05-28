import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pueblo_golf_tournament_mobile/screens/sign-in-screen/controller.dart';
import 'package:pueblo_golf_tournament_mobile/widgets/brand-elevated-button.dart';

import '../../widgets/brand-secondary-button.dart';

class SignInScreen extends StatelessWidget {
  final controller = Get.find<SignInScreenController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: Obx(
        () => SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(40, 30, 40, 30),
          child: SizedBox(
            height: 700,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                    height: 100,
                    child: Image(
                      image: AssetImage("assets/login-screen-image.png"),
                    )),
                Padding(padding: EdgeInsets.all(10)),
                const Text(
                  "Welcome back!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                controller.isFailedToLogin.value
                    ? Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 254, 232, 232)),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Sign In Failed. Please try again.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.w600),
                        ),
                      )
                    : Padding(padding: EdgeInsets.all(0)),
                Padding(padding: EdgeInsets.all(10)),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Username",
                      errorText: controller.isUserNameEmpty.value
                          ? "Please fill out this field."
                          : ""),
                  controller: controller.usernameTextController,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Password",
                      suffixIcon: IconButton(
                          onPressed: () => controller.peekPassword(),
                          icon: Icon(controller.isPeeked.value
                              ? Icons.visibility
                              : Icons.visibility_off)),
                      errorText: controller.isPasswordEmpty.value
                          ? "Please fill out this field."
                          : null),
                  obscureText: !controller.isPeeked.value,
                  controller: controller.passwordTextController,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Checkbox(
                        value: controller.isKeptSignedIn.value,
                        onChanged: (value) => controller.keepMeSignedIn()),
                    GestureDetector(
                        onTap: () => controller.keepMeSignedIn(),
                        child: Text(
                          "Keep me signed in",
                        ))
                  ],
                ),
                const Padding(padding: EdgeInsets.all(10)),
                BrandElevatedButton(
                    onPressed: !controller.isUserNameEmpty.value &&
                            !controller.isPasswordEmpty.value
                        ? () => controller.signIn()
                        : null,
                    title: "Sign In",
                    loading: controller.isLoading.value),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Divider(), Text("Forgot password?"), Divider()],
                  ),
                ),
                BrandSecondaryButton(
                    loading: false,
                    onPressed: () => controller.forgotPassword(),
                    title: "Reset Password"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
