import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pueblo_golf_tournament_mobile/screens/add-team-member-screen/controller.dart';
import 'package:pueblo_golf_tournament_mobile/widgets/brand-elevated-button.dart';

import '../../widgets/brand-secondary-button.dart';

class AddTeamMemberScreen extends StatelessWidget {
  final controller = Get.find<AddTeamMemberScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Member")),
      body: Obx(
        () => SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Wrap(
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              const Center(
                  child: Image(
                      image: AssetImage("assets/add-member-screen-image.png"))),
              Text(
                "Add your \nMember",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                textAlign: TextAlign.center,
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: "Enter Player ID Number",
                    errorText: controller.isPlayerNotFound.value
                        ? "Player not found. Please try again"
                        : ""),
                controller: controller.playerIdTextController,
              ),
              BrandElevatedButton(
                  onPressed: () => controller.searchPlayerId(),
                  title: "Add Member",
                  loading: controller.isAddingMember.value),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [Divider(), Text("Or"), Divider()],
              ),
              BrandSecondaryButton(
                  loading: false,
                  onPressed: () => controller.registerNewPlayer(),
                  title: "Register New"),
            ],
          ),
        ),
      ),
    );
  }
}
