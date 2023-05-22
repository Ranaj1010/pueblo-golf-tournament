import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:pueblo_golf_tournament_mobile/controllers/screens/add-member-screen-controller.dart';

class AddMemberScreen extends StatelessWidget {
  AddMemberScreen({super.key});

  final controller = Get.find<AddMemberScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: []),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Wrap(
          runSpacing: 20,
          children: [
            const Text(
              "Add Member",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 35),
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
                  hintText: 'BirthDate', suffixIcon: Icon(Icons.date_range)),
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
                "Contact Details",
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
                "Player Details",
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
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => controller.addMember(),
                      child: const Text("Add Member"))),
            )
          ],
        ),
      )),
    );
  }
}
