import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/tee-time-schedule-dto.dart';
import 'package:pueblo_golf_tournament_mobile/screens/manage-schedules-screen/controller.dart';
import 'package:pueblo_golf_tournament_mobile/widgets/brand-elevated-button.dart';

class ManageSchedulesScreen extends StatefulWidget {
  const ManageSchedulesScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return ManageSchedulesScreenState();
  }
}

class ManageSchedulesScreenState extends State<ManageSchedulesScreen> {
  final controller = Get.find<ManageSchedulesScreenController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(title: const Text("Manage Schedules")),
          body: controller.isLoadingSchedules.value
              ? const CircularProgressIndicator()
              : controller.teeTimeSchedules.isNotEmpty
                  ? ListView.separated(
                      itemBuilder: (context, index) => ExpansionTile(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              leading: const Icon(Icons.date_range),
                              title: Text(
                                DateFormat("MMMM dd, yyyy").format(
                                    controller.teeTimeSchedules[index].date),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              children: [
                                ...controller
                                    .teeTimeSchedules[index].timeSchedules!
                                    .map((e) => ListTile(
                                        leading: const Icon(Icons.alarm),
                                        title: Text(
                                          DateFormat("hh:mm a")
                                              .format(e.dateTimeSlot),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600),
                                        ),
                                        subtitle: !e.isFull
                                            ? Text(
                                                "Slots Available",
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .primaryColor),
                                              )
                                            : const Text("Full",
                                                style: TextStyle(
                                                    color: Colors.grey)),
                                        trailing: Switch(
                                          value: e.isEnabled,
                                          onChanged: (value) {
                                            controller.updateSchedule(
                                                index,
                                                TeeTimeScheduleDto(
                                                    tournamentId:
                                                        e.tournamentId,
                                                    dateTimeSlot:
                                                        e.dateTimeSlot,
                                                    isSelected: e.isSelected,
                                                    isFull: e.isFull,
                                                    isEnabled: value,
                                                    id: e.id));
                                          },
                                        )))
                              ]),
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: controller.teeTimeSchedules.length)
                  : EmptySchedulesStateWidget(
                      onPressGetStarted: () => controller.addSchedule()),
          floatingActionButton: controller.teeTimeSchedules.isNotEmpty
              ? FloatingActionButton.extended(
                  onPressed: () => controller.addSchedule(),
                  label: const Text("New Schedule"),
                  icon: const Icon(Icons.add),
                )
              : null,
        ));
  }
}

class EmptySchedulesStateWidget extends StatelessWidget {
  final Function onPressGetStarted;
  const EmptySchedulesStateWidget({super.key, required this.onPressGetStarted});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40),
      child: Center(
          child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        runSpacing: 10,
        alignment: WrapAlignment.center,
        children: [
          const Image(
            image: AssetImage("assets/empty.png"),
            height: 280,
          ),
          const Text(
            "It's empty out here",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const Text(
            "Setup the tournament schedules so the players can plot their tee time slots.",
            textAlign: TextAlign.center,
          ),
          const Padding(padding: EdgeInsets.all(20)),
          BrandElevatedButton(
              onPressed: onPressGetStarted,
              title: "Get Started",
              loading: false)
        ],
      )),
    );
  }
}
