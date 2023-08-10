import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pueblo_golf_tournament_mobile/dto/model/tee-time-schedule-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-tee-time-schedules-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/dto/response/lookup-tournament-team-response-dto.dart';
import 'package:pueblo_golf_tournament_mobile/screens/book-team-schedule/controller.dart';
import 'package:pueblo_golf_tournament_mobile/screens/book-team-schedule/widgets.dart';
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
          : controller.selectedPage.value!,
    );
  }
}
