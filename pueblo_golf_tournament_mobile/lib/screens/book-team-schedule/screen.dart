import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/tee-time-schedule-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-tee-time-schedules-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-tournament-team-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/screens/book-team-schedule/controller.dart';
import 'package:pueblo_golf_tournament_mobile/widgets/brand-elevated-button.dart';

class BookTeamScheduleScreen extends StatefulWidget {
  final PlayerProfile playerProfile;
  const BookTeamScheduleScreen({super.key, required this.playerProfile});

  @override
  State<StatefulWidget> createState() => BookTeamScheduleScreenState();
}

class BookTeamScheduleScreenState extends State<BookTeamScheduleScreen> {
  final controller = Get.find<BookTeamScheduleScreenController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.initialize(widget.playerProfile);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoadingSchedules.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : DefaultTabController(
              length: controller.teeTimeSchedules.length,
              child: Scaffold(
                appBar: AppBar(
                  title: const Text("Schedules"),
                  actions: [
                    controller.isBookingSchedules.value
                        ? const CircularProgressIndicator()
                        : TextButton.icon(
                            onPressed: () => controller.bookSchedules(),
                            icon: const Icon(Icons.save),
                            label: const Text("Save"))
                  ],
                  centerTitle: false,
                  backgroundColor: Colors.white,
                  surfaceTintColor: Colors.white,
                  bottom: PreferredSize(
                    preferredSize: const Size(double.infinity, 180),
                    child: Wrap(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 30, bottom: 20),
                          child: Wrap(
                            spacing: 20,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            children: [
                              CircleAvatar(
                                child: Icon(Icons.date_range),
                              ),
                              Text(
                                "Book your Tee Time \nschedule.",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 24),
                              ),
                            ],
                          ),
                        ),
                        TabBar(
                          isScrollable: controller.teeTimeSchedules.length > 4,
                          tabs: [
                            ...controller.teeTimeSchedules.map(
                              (element) => Tab(
                                height: 80,
                                child: Container(
                                  margin: const EdgeInsets.only(top: 15),
                                  child: Column(
                                    children: [
                                      Text(
                                        DateFormat("E").format(element.date),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        DateFormat("MM/dd ")
                                            .format(element.date),
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                body: TabBarView(
                  children: <Widget>[
                    ...controller.teeTimeSchedules.map((schedule) =>
                        SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 20),
                            child: Wrap(
                              runSpacing: 5,
                              children: [
                                ...schedule.timeSchedules!
                                    .where((element) =>
                                        element.isEnabled && !element.isFull)
                                    .map((e) => Card(
                                          surfaceTintColor:
                                              const Color.fromARGB(
                                                  255, 232, 232, 232),
                                          color: const Color.fromARGB(
                                              255, 232, 232, 232),
                                          elevation: 0,
                                          child: RadioListTile(
                                              title: Text(
                                                DateFormat("hh:mm a")
                                                    .format(e.dateTimeSlot),
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18),
                                              ),
                                              value: e,
                                              groupValue: controller
                                                  .selectedSchedules
                                                  .elementAt(controller
                                                      .teeTimeSchedules
                                                      .indexWhere((element) =>
                                                          element == schedule)),
                                              onChanged: (event) {
                                                var index = controller
                                                    .teeTimeSchedules
                                                    .indexWhere((element) =>
                                                        element == schedule);

                                                controller.selectTimeSlot(
                                                    index, event!);
                                              }),
                                        ))
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
    );
  }
}
