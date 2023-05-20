import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pueblo_golf_tournament_mobile/controllers/screens/login-screen-controller.dart';

class LoginScreen extends StatelessWidget {
  final controller = Get.find<LoginScreenController>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Sign In"), actions: []),
        body: Stack(children: [
          Image(
            fit: BoxFit.fill,
            image: AssetImage("assets/background-landing.png"),
            width: double.infinity,
            height: double.infinity,
          ),
          Obx(
            () => SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Wrap(
                runSpacing: 20,
                children: [
                  const Text(
                    "Enter your credentials",
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 35),
                  ),
                  TextField(
                    controller: controller.usernameTextController,
                    decoration: const InputDecoration(
                      hintText: 'Username',
                    ),
                  ),
                  TextField(
                    controller: controller.passwordTextController,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        suffixIcon: IconButton(
                            onPressed: () => controller.togglePeek(),
                            icon: controller.peekPassword.value
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off))),
                    obscureText: !controller.peekPassword.value,
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                      child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: controller.isLoggingIn.value ||
                                    !controller.isReady.value
                                ? null
                                : () => controller.signIn(),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).primaryColor,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.all(16.0)),
                            icon: controller.isLoggingIn.value
                                ? Container(
                                    width: 24,
                                    height: 24,
                                    padding: const EdgeInsets.all(2.0),
                                    child: const CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 3,
                                    ),
                                  )
                                : const Icon(Icons.login),
                            label: const Text('Sign In'),
                          ))),
                ],
              ),
            )),
          ),
        ]));
  }
}
