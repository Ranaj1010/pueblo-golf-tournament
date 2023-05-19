import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pueblo_golf_tournament_mobile/controllers/screens/register-team-screen-controller.dart';

class RegisterTeamScreen extends StatelessWidget {
  final controller = Get.find<RegisterTeamScreenController>();

  RegisterTeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(
        () => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Register your \nTeam",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
                const Padding(padding: EdgeInsets.all(20)),
                const Text("Profile",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Center(
                  child: InkWell(
                    enableFeedback: true,
                    splashColor: Colors.black,
                    borderRadius: BorderRadius.circular(50),
                    radius: 50,
                    onTap: () => controller.getTeamLogo(),
                    child: CircleAvatar(
                      maxRadius: 80,
                      backgroundImage: controller.logoImage.value != null
                          ? FileImage(controller.logoImage.value!)
                          : null,
                      child: Icon(
                        Icons.photo_camera,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(10)),
                TextField(
                  controller: controller.teamTextController,
                  decoration: InputDecoration(hintText: "Team Name"),
                ),
                const Padding(padding: EdgeInsets.all(10)),
                const Text("Members",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const Padding(padding: EdgeInsets.all(10)),
                GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  primary: false,
                  shrinkWrap: true,
                  // Create a grid with 2 columns. If you change the scrollDirection to
                  // horizontal, this produces 2 rows.
                  crossAxisCount: 2,
                  // Generate 100 widgets that display their index in the List.
                  children:
                      List.generate(controller.members.length + 1, (index) {
                    return SizedBox(
                      height: 180,
                      width: 190,
                      child: controller.members.length == index
                          ? SizedBox(
                              height: 200,
                              width: 195,
                              child: Card(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                        width: 0.5, color: Colors.grey),
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: InkWell(
                                  onTap: () => controller.goToAddMember(),
                                  child: const Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Wrap(
                                        alignment: WrapAlignment.center,
                                        direction: Axis.vertical,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        spacing: 10,
                                        runAlignment: WrapAlignment.center,
                                        children: [
                                          Icon(Icons.person_add_alt_outlined),
                                          Text("Add Member"),
                                        ],
                                      )),
                                ),
                              ),
                            )
                          : InkWell(
                              child: Card(
                                child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Wrap(
                                      alignment: WrapAlignment.center,
                                      direction: Axis.vertical,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      spacing: 5,
                                      runAlignment: WrapAlignment.center,
                                      children: [
                                        const CircleAvatar(
                                            child: Icon(Icons.person)),
                                        Text(
                                          "${controller.members[index].personalDetails.firstName} ${controller.members[index].personalDetails.lastName}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                            "${controller.members[index].playerDetails.homeClub}")
                                      ],
                                    )),
                              ),
                            ),
                    );
                  }),
                ),
                Text("Registration Fee",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Padding(padding: EdgeInsets.all(10)),
                TextField(
                  controller: controller.paymentMethodTextController,
                  decoration: InputDecoration(
                      hintText: "Payment Method",
                      suffixIcon: Icon(Icons.arrow_drop_down_sharp)),
                  readOnly: true,
                  onTap: () {
                    showModalBottomSheet<void>(
                        context: context,
                        showDragHandle: true,
                        builder: (BuildContext context) {
                          return Container(
                            height: 240,
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Select Payment Method",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(padding: EdgeInsets.all(10)),
                                  ListView.separated(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return index == 0
                                            ? ListTile(
                                                title: Text("GCash"),
                                                onTap: () {
                                                  controller
                                                      .paymentMethodTextController
                                                      .text = "Gcash";

                                                  Navigator.pop(context);
                                                })
                                            : ListTile(
                                                title: Text("Bank Deposit"),
                                                onTap: () {
                                                  controller
                                                      .paymentMethodTextController
                                                      .text = "Bank Deposit";

                                                  Navigator.pop(context);
                                                });
                                      },
                                      separatorBuilder: (context, index) =>
                                          Divider(),
                                      itemCount: 2)
                                ],
                              ),
                            ),
                          );
                        });
                  },
                ),
                Padding(padding: EdgeInsets.all(10)),
                TextField(
                  controller: controller.referrenceIdTextController,
                  decoration: InputDecoration(hintText: "Referrence ID"),
                ),
                Padding(padding: EdgeInsets.all(10)),
                SizedBox(
                  height: 350,
                  width: double.infinity,
                  child: Card(
                    elevation: 0,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    semanticContainer: true,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(width: 0.5, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: InkWell(
                      onTap: () => controller.getPaymentScrenshot(),
                      child: controller.paymentImage.value != null
                          ? Image(
                              image: FileImage(controller.paymentImage.value!),
                              fit: BoxFit.cover,
                            )
                          : Padding(
                              padding: EdgeInsets.all(20),
                              child: Wrap(
                                alignment: WrapAlignment.center,
                                direction: Axis.vertical,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                spacing: 10,
                                runAlignment: WrapAlignment.center,
                                children: [
                                  Icon(Icons.cloud_upload_outlined),
                                  Text(
                                    "Upload Payment \nScreen shot",
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () => controller.registerTeam(),
                          child: const Text("Register Team"))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
