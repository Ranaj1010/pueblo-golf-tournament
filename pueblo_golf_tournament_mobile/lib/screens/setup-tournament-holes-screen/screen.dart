import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/tournament-dto.dart';
import 'package:pueblo_golf_tournament_mobile/screens/setup-tournament-holes-screen/controller.dart';
import 'package:pueblo_golf_tournament_mobile/widgets/brand-elevated-button.dart';

class SetupTournamentHolesScreen extends StatefulWidget {
  const SetupTournamentHolesScreen({super.key});
  @override
  State<StatefulWidget> createState() => SetupTournamentHolesScreenState();
}

class SetupTournamentHolesScreenState
    extends State<SetupTournamentHolesScreen> {
  final controller = Get.find<SetupTournamentHolesScreenController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Manage Tournament Holes")),
      body: Obx(
        () => SingleChildScrollView(
          padding:
              const EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 20),
          child: Form(
            key: controller.formKey,
            child: SizedBox(
              width: double.infinity,
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 70),
                    width: double.infinity,
                    child: const Wrap(
                      spacing: 150,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.spaceBetween,
                      children: [
                        Text(
                          "Hole",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "PAR",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  ...controller.holes.map(
                    (element) => SizedBox(
                      width: double.infinity,
                      child: Wrap(
                        spacing: 50,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        alignment: WrapAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              "#${element.holeNumber}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                          SizedBox(
                            width: 180,
                            child: TextFormField(
                              readOnly: controller.isAlreadyConfigured.value,
                              textAlign: TextAlign.center,
                              decoration:
                                  const InputDecoration(hintText: "Enter PAR"),
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  controller.updateMaximumHole(
                                      element.holeNumber - 1, int.parse(value));
                                }
                              },
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ], // Only numbers can be entered
                              keyboardType: TextInputType.number,
                              initialValue: "${element.maximumStrokes}",
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value == "0") {
                                  return 'PAR is required.';
                                }
                                return null;
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(10)),
                  !controller.isAlreadyConfigured.value
                      ? BrandElevatedButton(
                          onPressed: controller.isSavingHoles.value
                              ? null
                              : () => controller.saveHoles(),
                          title: "Save Tournament Holes",
                          loading: controller.isSavingHoles.value)
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
