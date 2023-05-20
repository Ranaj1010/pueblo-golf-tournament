import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pueblo_golf_tournament_web/pages/tournaments-page/controller.dart';
import 'package:intl/intl.dart';
import '../../api/lookups/controller.dart';

class TournamentsPage extends StatelessWidget {
  final controller = Get.find<TournamentsScreenController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(
        () => Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: 800,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tournaments",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      ElevatedButton(
                          style: ButtonStyle(),
                          onPressed: () => {
                                showDialog<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      surfaceTintColor: Colors.white,
                                      title: const Text('Create Tournament'),
                                      content: Wrap(
                                        runSpacing: 10,
                                        children: [
                                          TextField(
                                            controller:
                                                controller.nameTextController,
                                            decoration: InputDecoration(
                                                hintText: "Name"),
                                          ),
                                          TextField(
                                            controller:
                                                controller.nameTextController,
                                            decoration: InputDecoration(
                                                hintText: "Venue Place"),
                                          ),
                                          TextField(
                                            controller:
                                                controller.nameTextController,
                                            decoration: InputDecoration(
                                                hintText: "Address"),
                                          ),
                                          TextField(
                                            controller:
                                                controller.nameTextController,
                                            decoration: InputDecoration(
                                                hintText: "City"),
                                          ),
                                          TextField(
                                            readOnly: true,
                                            controller: controller
                                                .startDateTextController,
                                            decoration: const InputDecoration(
                                                hintText: 'Start Date',
                                                suffixIcon:
                                                    Icon(Icons.date_range)),
                                            onTap: () async {
                                              DateTime? pickedDate =
                                                  await showDatePicker(
                                                      context: context,
                                                      initialDate: DateTime
                                                          .now(), //get today's date
                                                      firstDate: DateTime(
                                                          2000), //DateTime.now() - not to allow to choose before today.
                                                      lastDate: DateTime(2101));

                                              if (pickedDate != null) {
                                                String formattedDate =
                                                    DateFormat('MMMM dd, yyyy')
                                                        .format(pickedDate);
                                                controller
                                                    .startDateTextController
                                                    .text = formattedDate;
                                              } else {
                                                print("Date is not selected");
                                              }
                                            },
                                          ),
                                          TextField(
                                            readOnly: true,
                                            controller: controller
                                                .endDateTextController,
                                            decoration: const InputDecoration(
                                                hintText: 'End Date',
                                                suffixIcon:
                                                    Icon(Icons.date_range)),
                                            onTap: () async {
                                              DateTime? pickedDate =
                                                  await showDatePicker(
                                                      context: context,
                                                      initialDate: DateTime
                                                          .now(), //get today's date
                                                      firstDate: DateTime(
                                                          2000), //DateTime.now() - not to allow to choose before today.
                                                      lastDate: DateTime(2101));

                                              if (pickedDate != null) {
                                                String formattedDate =
                                                    DateFormat('MMMM dd, yyyy')
                                                        .format(pickedDate);
                                                controller.endDateTextController
                                                    .text = formattedDate;
                                              } else {
                                                print("Date is not selected");
                                              }
                                            },
                                          ),
                                          TextField(
                                            controller: controller
                                                .numberOfLotsTextControler,
                                            decoration: InputDecoration(
                                                hintText: "No. of Slots"),
                                            keyboardType: TextInputType.number,
                                          ),
                                        ],
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .labelLarge,
                                          ),
                                          child: const Text('Cancel'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        TextButton(
                                          style: TextButton.styleFrom(
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .labelLarge,
                                          ),
                                          child: const Text('Create'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              },
                          child: Text("Create Tournament"))
                    ],
                  ),
                  const Padding(padding: EdgeInsets.all(20)),
                  Card(
                    surfaceTintColor: Colors.white,
                    elevation: 3,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => ListTile(
                              onTap: () => {},
                              leading: const CircleAvatar(
                                  child: Icon(Icons.sports_golf)),
                              title: Text(
                                controller.tournaments[index].name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600),
                              ),
                              subtitle: Text(
                                  controller.tournaments[index].venuePlace!),
                            ),
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: controller.tournaments.length),
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
