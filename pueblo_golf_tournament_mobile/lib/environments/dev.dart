import 'package:flutter/material.dart';
import '../app.dart';
import '../configurations/flavors.dart';

void main() async {
  DevFlavorConfig().startSetup();
  runApp(const App());
}
