import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:pueblo_golf_tournament_mobile/data/context.dart';
import 'package:pueblo_golf_tournament_mobile/screens/book-team-schedule/screen.dart';
import 'package:pueblo_golf_tournament_mobile/screens/registered-team-details-screen/controller.dart';
import 'package:pueblo_golf_tournament_mobile/screens/registered-team-details-screen/screen.dart';
import 'package:pueblo_golf_tournament_mobile/screens/view-team-member-screen/controller.dart';
import 'package:pueblo_golf_tournament_mobile/widgets/brand-secondary-button.dart';

class ViewTeamMemberScreen extends StatefulWidget {
  const ViewTeamMemberScreen({super.key});

  @override
  State<ViewTeamMemberScreen> createState() => _ViewTeamMemberScreenState();
}

class _ViewTeamMemberScreenState extends State<ViewTeamMemberScreen> {
  final controller = Get.find<ViewTeamMemberScreenController>();
  final dataContextController = Get.find<DataContextController>();
  final registeredTeamScreenController =
      Get.find<RegisteredTeamDetailsScreenController>();

  @override
  void initState() {
    super.initState();
    controller.initialize(registeredTeamScreenController.selectedMember.value!);
  }

  Widget playerType(int value) {
    switch (value) {
      case 0:
        return const Text(
          "Captain",
          style:
              TextStyle(color: Color.fromARGB(255, 39, 144, 43), fontSize: 18),
        );

      case 1:
        return const Text(
          "Member",
          style: TextStyle(color: Colors.blue, fontSize: 18),
        );

      default:
        return const Text("Unknown");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Member Details"),
        actions: [
          IconButton(
              onPressed: () => controller.editProfile(
                  registeredTeamScreenController.selectedMember.value!),
              icon: const Icon(Icons.edit))
        ],
      ),
      body: Obx(
        () => SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: SizedBox(
              width: double.infinity,
              child: Wrap(
                runSpacing: 10,
                alignment: WrapAlignment.center,
                children: [
                  controller.playerSchedules.isEmpty &&
                          registeredTeamScreenController
                              .registeredTeam.value!.registration.isPayed &&
                          registeredTeamScreenController
                                  .registeredTeam.value!.registration.status ==
                              1
                      ? Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Wrap(
                                spacing: 10,
                                children: [
                                  Icon(Icons.info_rounded, color: Colors.white),
                                  Text(
                                    "You can now book your \ntee time schedules.",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                  onPressed: () async {
                                    await Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>
                                          BookTeamScheduleScreen(
                                              playerProfile:
                                                  registeredTeamScreenController
                                                      .selectedMember.value!),
                                    ));
                                    controller.loadScheduls();
                                  },
                                  child: const Text("Book Now"))
                            ],
                          ),
                        )
                      : const Padding(padding: EdgeInsets.all(0)),
                  const Image(
                      image: AssetImage("assets/add-member-screen-image.png")),
                  Column(
                    children: [
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
                    ],
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Wrap(
                        runSpacing: 5,
                        children: [
                          ListTile(
                            title: Text(DateFormat('MMMM dd, yyyy').format(
                                registeredTeamScreenController
                                    .selectedMember.value!.person.birthDate)),
                            subtitle: const Text(
                              "Birth Date",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          ListTile(
                            subtitle: const Text(
                              "Contact Number",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            title: Text(registeredTeamScreenController
                                .selectedMember.value!.person.contactNumber),
                          ),
                          ListTile(
                            subtitle: const Text(
                              "Home Address",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            title: Text(
                                registeredTeamScreenController
                                    .selectedMember.value!.person.homeAddress,
                                overflow: TextOverflow.clip),
                          ),
                          ListTile(
                            subtitle: const Text(
                              "City",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            title: Text(registeredTeamScreenController
                                .selectedMember.value!.person.city),
                          ),
                          ListTile(
                            subtitle: const Text(
                              "Country",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            title: Text(registeredTeamScreenController
                                .selectedMember.value!.person.country),
                          ),
                          ListTile(
                            subtitle: const Text(
                              "Email Address",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            title: Text(registeredTeamScreenController
                                .selectedMember.value!.person.emailAddress),
                          ),
                          const Divider(),
                          ListTile(
                            subtitle: const Text(
                              "Home Club",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            title: Text(registeredTeamScreenController
                                .selectedMember.value!.player.homeClub),
                          ),
                          ListTile(
                            subtitle: const Text(
                              "WHS ID",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            title: Text(registeredTeamScreenController
                                .selectedMember
                                .value!
                                .player
                                .worldHandicapSystemId),
                          ),
                        ],
                      ),
                    ),
                  ),
                  controller.isLoadingSchedules.value
                      ? const CircularProgressIndicator()
                      : controller.playerSchedules.isNotEmpty
                          ? Wrap(
                              runSpacing: 10,
                              runAlignment: WrapAlignment.start,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              children: [
                                const Text(
                                  "Tee Time",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Card(
                                  child: ListView.separated(
                                      shrinkWrap: true,
                                      padding: const EdgeInsets.all(0),
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) => ListTile(
                                            leading: const CircleAvatar(
                                              child: Icon(Icons.date_range),
                                            ),
                                            trailing: controller
                                                        .playerSchedules[index]
                                                        .holeType ==
                                                    0
                                                ? Text(
                                                    "Front 9",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Theme.of(context)
                                                            .primaryColor),
                                                  )
                                                : Text(
                                                    "Back 9",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Theme.of(context)
                                                            .primaryColor),
                                                  ),
                                            title: Text(
                                              DateFormat("E, MMMM dd, yyyy")
                                                  .format(controller
                                                      .playerSchedules[index]
                                                      .timeSchedules![0]
                                                      .dateTimeSlot),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            subtitle: Text(DateFormat("hh:mm a")
                                                .format(controller
                                                    .playerSchedules[index]
                                                    .timeSchedules![0]
                                                    .dateTimeSlot)),
                                          ),
                                      separatorBuilder: (context, index) =>
                                          const Divider(),
                                      itemCount:
                                          controller.playerSchedules.length),
                                )
                              ],
                            )
                          : const Padding(padding: EdgeInsets.all(0))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
