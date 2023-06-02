import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:pueblo_golf_tournament_mobile/screens/registered-team-details-screen/controller.dart';
import 'package:pueblo_golf_tournament_mobile/screens/registered-team-details-screen/screen.dart';
import 'package:pueblo_golf_tournament_mobile/screens/view-team-member-screen/controller.dart';
import 'package:pueblo_golf_tournament_mobile/widgets/brand-secondary-button.dart';

class ViewTeamMemberScreen extends StatelessWidget {
  final controller = Get.find<ViewTeamMemberScreenController>();
  final registeredTeamScreenController =
      Get.find<RegisteredTeamDetailsScreenController>();
  Widget playerType(int value) {
    switch (value) {
      case 0:
        return Text(
          "Captain",
          style: TextStyle(
              color: const Color.fromARGB(255, 39, 144, 43), fontSize: 18),
        );

      case 1:
        return Text(
          "Member",
          style: TextStyle(color: Colors.blue, fontSize: 18),
        );

      default:
        return Text("Unknown");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Member Details"),
      ),
      body: Obx(
        () => SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Image(
                      image: AssetImage("assets/add-member-screen-image.png")),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "${registeredTeamScreenController.selectedMember.value!.person.firstName} ${registeredTeamScreenController.selectedMember.value!.person.middleName} ${registeredTeamScreenController.selectedMember.value!.person.lastName}",
                      style: const TextStyle(
                          fontSize: 28, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  playerType(registeredTeamScreenController
                      .selectedMember.value!.player.playerType),
                  const Padding(padding: EdgeInsets.all(10)),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Wrap(
                        runSpacing: 20,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Birth Date",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(DateFormat('MMMM dd, yyyy').format(
                                  registeredTeamScreenController
                                      .selectedMember.value!.person.birthDate)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Contact Number",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(registeredTeamScreenController
                                  .selectedMember.value!.person.contactNumber),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Home Address",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(registeredTeamScreenController
                                  .selectedMember.value!.person.homeAddress),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "City",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(registeredTeamScreenController
                                  .selectedMember.value!.person.city),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Country",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(registeredTeamScreenController
                                  .selectedMember.value!.person.country),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Email Address",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(registeredTeamScreenController
                                  .selectedMember.value!.person.emailAddress),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Home Club",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(registeredTeamScreenController
                                  .selectedMember.value!.player.homeClub),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "WHS ID",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(registeredTeamScreenController.selectedMember
                                  .value!.player.worldHandicapSystemId),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: BrandSecondaryButton(
                        onPressed: () => controller.editProfile(
                            registeredTeamScreenController
                                .selectedMember.value!),
                        title: "Edit",
                        loading: false),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
