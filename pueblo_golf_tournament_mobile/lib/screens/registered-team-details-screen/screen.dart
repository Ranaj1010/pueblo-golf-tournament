import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:pueblo_golf_tournament_mobile/screens/registered-team-details-screen/controller.dart';

class RegisteredTeamDetailsScreen extends StatelessWidget {
  final controller = Get.find<RegisteredTeamDetailsScreenController>();

  Widget status(int value) {
    switch (value) {
      case 0:
        return Text(
          "Pending",
          style: TextStyle(color: Colors.orange),
        );

      case 1:
        return Text(
          "Confirmed",
          style: TextStyle(color: Colors.green),
        );

      case 2:
        return Text(
          "Cancelled",
          style: TextStyle(color: Colors.red),
        );

      default:
        return Text("Unknown");
    }
  }

  Widget playerType(int value) {
    switch (value) {
      case 0:
        return Text(
          "Captain",
          style: TextStyle(
            color: const Color.fromARGB(255, 39, 144, 43),
          ),
        );

      case 1:
        return Text(
          "Member",
          style: TextStyle(color: Colors.blue),
        );

      default:
        return Text("Unknown");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Team Details"),
      ),
      body: Obx(
        () => SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Wrap(
            runSpacing: 20,
            children: [
              Card(
                elevation: 10,
                child: ListTile(
                  leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          controller.registeredTeam.value!.team.logoUrl!)),
                  title: Text(
                    controller.registeredTeam.value!.team.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: status(
                      controller.registeredTeam.value!.registration.status),
                ),
              ),
              const Text(
                "Registration",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Card(
                child: ListView(
                  padding: EdgeInsets.all(0),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    ListTile(
                      trailing: Icon(Icons.date_range),
                      title: Text(
                        DateFormat("MMMM dd yyyy").format(controller
                            .registeredTeam
                            .value!
                            .registration
                            .registrationDate),
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      subtitle: Text("Registration Date"),
                    ),
                  ],
                ),
              ),
              Text(
                "Payment via ${controller.registeredTeam.value!.payment.paymentMethod}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Card(
                child: ListView(
                  padding: EdgeInsets.all(0),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    ListTile(
                      trailing: Icon(Icons.payment),
                      title: Text(
                        controller.registeredTeam.value!.payment.referrenceId,
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      subtitle: Text("Referrence Number"),
                    ),
                  ],
                ),
              ),
              const Text(
                "Members",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: ListView.separated(
                    padding: const EdgeInsets.all(0),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => ListTile(
                          leading:
                              CircleAvatar(child: const Icon(Icons.person)),
                          title: Text(
                              "${controller.registeredTeam.value!.memberProfiles![index].person.firstName} ${controller.registeredTeam.value!.memberProfiles![index].person.middleName} ${controller.registeredTeam.value!.memberProfiles![index].person.lastName}"),
                          subtitle: playerType(controller.registeredTeam.value!
                              .memberProfiles![index].player.playerType),
                        ),
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: controller
                        .registeredTeam.value!.memberProfiles!.length),
              )
            ],
          ),
        ),
      ),
    );
  }
}
