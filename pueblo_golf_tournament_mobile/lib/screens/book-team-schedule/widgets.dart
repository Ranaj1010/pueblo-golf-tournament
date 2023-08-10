import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/tee-time-schedule-dto.dart';
import 'package:pueblo_golf_tournament_mobile/widgets/brand-secondary-button.dart';

import '../../dto/response/lookup-tee-time-schedules-response-dto.dart';
import '../../widgets/brand-elevated-button.dart';
import 'controller.dart';

class PlottingScheduleWidget extends StatelessWidget {
  final int tabLength;
  final bool isBookingSchedules, isTabBarScrollable;
  final Function? bookSchedules;
  final Function? back;
  final Function(int index, int value) updateHoleType;
  final Function(int index, TeeTimeScheduleDto value) selectTimeSlot;
  final List<TournamentScheduleDate> teeTimeSchedules;
  final List<TeeTimeScheduleDto> selectedSchedules;
  final List<int> selectedScheduleHoleType;
  const PlottingScheduleWidget({
    super.key,
    required this.tabLength,
    required this.isBookingSchedules,
    required this.isTabBarScrollable,
    required this.bookSchedules,
    required this.updateHoleType,
    required this.selectTimeSlot,
    required this.teeTimeSchedules,
    required this.selectedSchedules,
    required this.selectedScheduleHoleType,
    required this.back,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: teeTimeSchedules.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Schedules"),
          centerTitle: false,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 200),
            child: Wrap(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 30, right: 30, bottom: 20),
                  child: SizedBox(
                    width: double.infinity,
                    child: Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      spacing: 20,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runAlignment: WrapAlignment.spaceBetween,
                      children: [
                        Text(
                          "Book your Tee Time \nschedule.",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        Image(
                          image: AssetImage("assets/select-date-time.png"),
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                ),
                TabBar(
                  isScrollable: teeTimeSchedules.length > 5,
                  tabs: [
                    ...teeTimeSchedules.map(
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
                                DateFormat("MM/dd ").format(element.date),
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
            ...teeTimeSchedules.map((schedule) => SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Wrap(
                      runSpacing: 10,
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 2,
                          itemBuilder: (context, index) => Card(
                            surfaceTintColor:
                                const Color.fromARGB(255, 232, 232, 232),
                            color: const Color.fromARGB(255, 232, 232, 232),
                            elevation: 0,
                            child: RadioListTile(
                                title: Text(
                                  index == 0 ? "Front 9" : "Back 9",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                ),
                                value: index,
                                groupValue: selectedScheduleHoleType.elementAt(
                                    teeTimeSchedules.indexWhere(
                                        (element) => element == schedule)),
                                onChanged: (event) {
                                  var index = teeTimeSchedules.indexWhere(
                                      (element) => element == schedule);

                                  updateHoleType(index, event!);
                                }),
                          ),
                        ),
                        const Divider(),
                        ...schedule.timeSchedules!
                            .where((element) =>
                                element.isEnabled && !element.isFull)
                            .map((e) => Card(
                                  surfaceTintColor:
                                      const Color.fromARGB(255, 232, 232, 232),
                                  color:
                                      const Color.fromARGB(255, 232, 232, 232),
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
                                      groupValue: selectedSchedules.elementAt(
                                          teeTimeSchedules.indexWhere(
                                              (element) =>
                                                  element == schedule)),
                                      onChanged: (event) {
                                        var index = teeTimeSchedules.indexWhere(
                                            (element) => element == schedule);

                                        selectTimeSlot(index, event!);
                                      }),
                                )),
                        const Divider(),
                        SizedBox(
                          width: double.maxFinite,
                          height: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 150,
                                child: BrandSecondaryButton(
                                    onPressed: isBookingSchedules ? null : back,
                                    title: "Back",
                                    loading: false),
                              ),
                              SizedBox(
                                width: 150,
                                child: BrandElevatedButton(
                                    onPressed: selectedSchedules.length < 2
                                        ? null
                                        : bookSchedules,
                                    title: "Submit",
                                    loading: isBookingSchedules),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class SelectAvailableDatesWidget extends StatelessWidget {
  final Function(DateTime index) addToSelectedDateSchedule;
  final Function(DateTime index) removeToSelectedDateSchedule;
  final List<TournamentScheduleDate> teeTimeSchedules;
  final List<TeeTimeScheduleDto> selectedSchedules;
  final List<DateTime> selectedDateSchedules;
  final Function onClickContinue;
  const SelectAvailableDatesWidget({
    super.key,
    required this.addToSelectedDateSchedule,
    required this.removeToSelectedDateSchedule,
    required this.teeTimeSchedules,
    required this.selectedSchedules,
    required this.selectedDateSchedules,
    required this.onClickContinue,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Schedules"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Wrap(
          runSpacing: 20,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: SizedBox(
                width: double.infinity,
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  spacing: 20,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runAlignment: WrapAlignment.spaceBetween,
                  children: [
                    Text(
                      "Choose dates \nfrom available \nschedules",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    Image(
                      image: AssetImage("assets/select-date-time.png"),
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
            Wrap(
              children: [
                ...teeTimeSchedules.map((element) => CheckboxListTile(
                      enabled: selectedDateSchedules.length <= 1 ||
                          selectedDateSchedules.contains(element.date),
                      title: Text(
                          DateFormat("E MMMM dd, yyyy").format(element.date)),
                      value: selectedDateSchedules.contains(element.date),
                      onChanged: (value) =>
                          selectedDateSchedules.contains(element.date)
                              ? removeToSelectedDateSchedule(element.date)
                              : addToSelectedDateSchedule(element.date),
                    ))
              ],
            ),
            BrandElevatedButton(
                onPressed: selectedDateSchedules.length <= 1
                    ? null
                    : () => onClickContinue(),
                title: "Continue",
                loading: false)
          ],
        ),
      ),
    );
  }
}
