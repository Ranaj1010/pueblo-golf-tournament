import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:pueblo_golf_tournament_web/pages/dashboard-page/page.dart';
import 'package:pueblo_golf_tournament_web/pages/divisions-page/page.dart';
import 'package:pueblo_golf_tournament_web/pages/schedules-page/page.dart';
import 'package:pueblo_golf_tournament_web/pages/tournaments-page/page.dart';

class HomeScreenController extends GetxController {
  var selectedPage = 0.obs;
  var pages = [TournamentsPage(), DivisionPage()].obs;
  var menuPages = ["Tournaments", "Division"].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  selectPage(int index) {
    selectedPage(index);
  }
}
