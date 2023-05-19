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
      appBar: AppBar(actions: []),
      body: Obx(
        () => SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Wrap(
            runSpacing: 20,
            children: [
              const Text(
                "Sign in",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 35),
              ),
              TextField(
                controller: controller.usernameTextController,
                decoration: const InputDecoration(
                  hintText: 'Enter Username',
                ),
              ),
              TextField(
                controller: controller.passwordTextController,
                decoration: InputDecoration(
                    hintText: 'Enter Password',
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
                    child: ElevatedButton(
                        onPressed: () => controller.signIn(),
                        child: const Text("Sign In"))),
              )
            ],
          ),
        )),
      ),
    );
  }
}
