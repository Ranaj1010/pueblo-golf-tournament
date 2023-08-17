import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pueblo_golf_tournament_mobile/screens/manage-schedules-screen/controller.dart';
import 'package:pueblo_golf_tournament_mobile/screens/manage-scorers-screen/controller.dart';
import 'package:pueblo_golf_tournament_mobile/screens/manage-scorers-screen/widgets.dart';

class ManageScorersScreen extends StatefulWidget {
  const ManageScorersScreen({super.key});

  @override
  State<StatefulWidget> createState() => ManageScorersScreenState();
}

class ManageScorersScreenState extends State<ManageScorersScreen> {
  final controller = Get.find<ManageScorersScreenController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Scorers"),
        centerTitle: false,
      ),
      body: Obx(
        () => controller.isLoadingScorers.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : controller.scorers.isNotEmpty
                ? SingleChildScrollView(
                    child: Wrap(
                      runSpacing: 10,
                      children: [
                        ...controller.scorers.map((element) => ListTile(
                              leading:
                                  const CircleAvatar(child: Icon(Icons.person)),
                              title: Text(
                                  "${element.person?.lastName}, ${element.person?.firstName} ${element.person?.middleName}"),
                            ))
                      ],
                    ),
                  )
                : EmptyScorersStateWidget(
                    onPressGetStarted: () => controller.registerNewScorer(),
                  ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => controller.registerNewScorer(),
        label: const Text("Register"),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
