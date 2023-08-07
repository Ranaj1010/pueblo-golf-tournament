import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:pueblo_golf_tournament_mobile/dto/request/setup-tournament-schedules-request-dto.dart';
import 'package:pueblo_golf_tournament_mobile/screens/add-tournament-schedule-screen/controller.dart';
import 'package:pueblo_golf_tournament_mobile/widgets/brand-elevated-button.dart';
import 'package:pueblo_golf_tournament_mobile/widgets/labels.dart';
import 'package:table_calendar/table_calendar.dart';

class AddTournamentScheduleScreen extends StatefulWidget {
  const AddTournamentScheduleScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return AddTournamentScheduleScreenState();
  }
}

class AddTournamentScheduleScreenState
    extends State<AddTournamentScheduleScreen> {
  final controller = Get.find<AddTournamentScheduleScreenController>();

  @override
  void initState() {
    super.initState();
    controller.initializeTimeSlots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Add Schedule"),
          actions: [
            IconButton(
                onPressed: () => controller.saveSchedule(),
                icon: const Icon(Icons.save))
          ],
        ),
        body: Obx(
          () => SingleChildScrollView(
            child: Wrap(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Select a Day \nand Time",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                        Image(
                          image: AssetImage("assets/select-date-time.png"),
                        ),
                      ]),
                ),
                TableCalendar(
                  locale: "en_US",
                  rangeSelectionMode: RangeSelectionMode.disabled,
                  weekNumbersVisible: false,
                  selectedDayPredicate: (day) => isSameDay(
                    day,
                    controller.selectedDate.value!,
                  ),
                  currentDay: controller.selectedDate.value,
                  onDaySelected: (selectedDay, focusedDay) =>
                      controller.selectDate(focusedDay),
                  calendarStyle: const CalendarStyle(
                      todayTextStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                  headerStyle: const HeaderStyle(
                      formatButtonVisible: false,
                      titleTextStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  pageJumpingEnabled: false,
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: DateTime.now(),
                  availableGestures: AvailableGestures.all,
                ),
                Container(
                    color: const Color.fromARGB(255, 218, 218, 218),
                    width: double.infinity,
                    child: const HorizontalCardsTitle(title: "Timeslots")),
                controller.timeSlots.isEmpty
                    ? const Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Center(
                          child: Text("No timeslots available yet. "),
                        ),
                      )
                    : ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => Dismissible(
                              direction: DismissDirection.endToStart,
                              background: Container(
                                  color: Colors.red,
                                  padding: const EdgeInsets.only(right: 20),
                                  child: const Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "Remove",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  )),
                              onDismissed: (direction) => controller
                                  .removeTimeSlot(controller.timeSlots[index]),
                              key: Key(controller
                                  .timeSlots[index].timeSeriesSlot
                                  .toString()),
                              child: ListTile(
                                onTap: () async {
                                  controller.selectedTime(TimeOfDay(
                                      hour: controller
                                          .timeSlots[index].timeSeriesSlot.hour,
                                      minute: controller.timeSlots[index]
                                          .timeSeriesSlot.minute));
                                  final TimeOfDay? time = await showTimePicker(
                                    context: context,
                                    initialTime: controller.selectedTime.value!,
                                    initialEntryMode: TimePickerEntryMode.dial,
                                    orientation: Orientation.portrait,
                                    builder:
                                        (BuildContext context, Widget? child) {
                                      return Theme(
                                        data: Theme.of(context).copyWith(
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.padded,
                                        ),
                                        child: MediaQuery(
                                          data: MediaQuery.of(context).copyWith(
                                            alwaysUse24HourFormat: false,
                                          ),
                                          child: child!,
                                        ),
                                      );
                                    },
                                  );

                                  if (time != null) {
                                    controller.updateTimeSlot(
                                      controller.timeSlots[index],
                                      TimeSlotDto(
                                          timeSeriesSlot: DateTime(
                                            controller.selectedDate.value!.year,
                                            controller
                                                .selectedDate.value!.month,
                                            controller.selectedDate.value!.day,
                                            time!.hour,
                                            time.minute,
                                          ),
                                          isEnabled: true,
                                          isSelected: true),
                                    );
                                  }
                                },
                                title: Text(
                                  DateFormat("hh:mm a").format(controller
                                      .timeSlots[index].timeSeriesSlot),
                                  style: TextStyle(
                                      color:
                                          controller.timeSlots[index].isEnabled
                                              ? Colors.black
                                              : Colors.grey,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600),
                                ),
                                trailing: Switch(
                                  value: controller.timeSlots[index].isEnabled,
                                  onChanged: (value) {
                                    controller.onChangeTimeSlotAvailability(
                                        controller.timeSlots[index]);
                                  },
                                ),
                              ),
                            ),
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: controller.timeSlots.length)
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            final TimeOfDay? time = await showTimePicker(
              context: context,
              initialTime: controller.selectedTime.value!,
              initialEntryMode: TimePickerEntryMode.dial,
              orientation: Orientation.portrait,
              builder: (BuildContext context, Widget? child) {
                return Theme(
                  data: Theme.of(context).copyWith(
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                  ),
                  child: MediaQuery(
                    data: MediaQuery.of(context).copyWith(
                      alwaysUse24HourFormat: false,
                    ),
                    child: child!,
                  ),
                );
              },
            );

            if (time != null) {
              controller.addTimeSlot(TimeSlotDto(
                  timeSeriesSlot: DateTime(
                    controller.selectedDate.value!.year,
                    controller.selectedDate.value!.month,
                    controller.selectedDate.value!.day,
                    time!.hour,
                    time.minute,
                  ),
                  isEnabled: true,
                  isSelected: false));
            }
          },
          label: const Text("New Timeslot"),
          icon: const Icon(Icons.add),
        ));
  }
}
