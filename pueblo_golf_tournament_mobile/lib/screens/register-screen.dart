import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:pueblo_golf_tournament_mobile/controllers/screens/registration-screen-controller.dart';

class RegisterScreen extends StatelessWidget {
  final controller = Get.find<RegistrationScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Register"), actions: []),
        body: Obx(
          () => SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Wrap(
              runSpacing: 20,
              children: [
                const Text(
                  "Create your \nAccount!",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 35),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Text(
                      "Basic",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                TextField(
                  controller: controller.firstNameTextController,
                  decoration: const InputDecoration(
                    hintText: 'First Name',
                  ),
                ),
                TextField(
                  controller: controller.middleNameTextController,
                  decoration: const InputDecoration(
                    hintText: 'Middle Name',
                  ),
                ),
                TextField(
                  controller: controller.lastNameTextController,
                  decoration: const InputDecoration(
                    hintText: 'Last Name',
                  ),
                ),
                TextField(
                  readOnly: true,
                  controller: controller.birthDateTextController,
                  decoration: const InputDecoration(
                      hintText: 'BirthDate',
                      suffixIcon: Icon(Icons.date_range)),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(), //get today's date
                        firstDate: DateTime(
                            1900), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));

                    if (pickedDate != null) {
                      String formattedDate =
                          DateFormat('MMMM dd, yyyy').format(pickedDate);
                      controller.birthDateTextController.text = formattedDate;
                    } else {
                      print("Date is not selected");
                    }
                  },
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Text(
                    "Contact",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                TextField(
                  controller: controller.contactTextController,
                  decoration: const InputDecoration(
                    hintText: 'Contact Number',
                  ),
                ),
                TextField(
                  controller: controller.emailAddressTextController,
                  decoration: const InputDecoration(
                    hintText: 'Email Address',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Text(
                    "Player",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                TextField(
                  controller: controller.whsIdController,
                  decoration: const InputDecoration(
                      hintText: 'World Handicap System ID',
                      helperText: "If no WHS, type '0'"),
                ),
                TextField(
                  controller: controller.handicapTextController,
                  decoration: const InputDecoration(
                    hintText: 'Handicap',
                  ),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: controller.homeClubTextController,
                  decoration: const InputDecoration(
                    hintText: 'Home Club',
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Text(
                    "Account",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
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
                TextField(
                  controller: controller.confirmPasswordTextController,
                  decoration: InputDecoration(
                      hintText: 'Confirm Password',
                      suffixIcon: IconButton(
                          onPressed: () =>
                              controller.togglePeekConfirmPassword(),
                          icon: controller.peekConfirmPassword.value
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off))),
                  obscureText: !controller.peekConfirmPassword.value,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: controller.isRegistering.value ||
                                !controller.isReady.value
                            ? null
                            : () => controller.register(),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.all(16.0)),
                        icon: controller.isRegistering.value
                            ? Container(
                                width: 24,
                                height: 24,
                                padding: const EdgeInsets.all(2.0),
                                child: const CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 3,
                                ),
                              )
                            : const Icon(Icons.app_registration),
                        label: const Text('Register'),
                      )),
                )
              ],
            ),
          )),
        ));
  }
}
