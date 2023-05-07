import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/account-controller.dart';
import '../widgets/common-widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final accountController = Get.find<AccountController>();
  bool isReady = false;
  FocusNode initialFocusNode = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 500)).then((value) {
      setState(() {
        isReady = true;
        initialFocusNode.requestFocus();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 60, 30, 20),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.center,
              children: [
                Wrap(
                  spacing: 20,
                  runAlignment: WrapAlignment.center,
                  direction: Axis.vertical,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image(
                        image: AssetImage('assets/logo-golf-big.png'),
                        height: 150,
                      ),
                    ),
                    AnimatedOpacity(
                        opacity: isReady ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 200),
                        child: Wrap(
                          spacing: 2,
                          direction: Axis.vertical,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Text(
                              'Welcome!',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w800),
                            ),
                            Text(
                              'Log in to your account',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey),
                            )
                          ],
                        )),
                  ],
                ),
                AnimatedOpacity(
                    opacity: isReady ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 200),
                    child: Column(
                      children: [
                        const Padding(
                            padding: EdgeInsets.fromLTRB(10, 30, 10, 20)),
                        BrandTextField(
                          focusNode: initialFocusNode,
                          hintText: "",
                          controller: emailController,
                          labelText: "Username",
                          textInputType: TextInputType.emailAddress,
                        ),
                        const Padding(padding: EdgeInsets.all(5)),
                        BrandTextField(
                          hintText: "",
                          controller: passwordController,
                          labelText: "Password",
                          errorMessage: accountController.isLoginFailed.value
                              ? "Invalid email or password"
                              : "",
                          obscureText: accountController.isPasswordHidden.value,
                          trailButton: IconButton(
                              icon: Icon(
                                  accountController.isPasswordHidden.value
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                              onPressed: () =>
                                  accountController.peekPassword()),
                        ),
                        Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () => {},
                              child: const Text('Forgot password?'),
                            )),
                        const Padding(padding: EdgeInsets.all(10)),
                        BrandElevatedButton(
                          isFluid: true,
                          child: const Text("Log in"),
                          onPressed: () => accountController.login(
                              emailController.text, passwordController.text),
                        ),
                        const Padding(padding: EdgeInsets.all(30)),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account yet?",
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                      TextButton(
                        onPressed: () => accountController.goToSignUp(),
                        child: const Text(
                          'Sign Up.',
                          style: TextStyle(color: Colors.redAccent),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
