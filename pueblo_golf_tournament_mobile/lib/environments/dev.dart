import 'package:flutter/material.dart';
import '../app.dart';
import '../configs/flavor-config.dart';

void main() async {
  DevFlavorConfig().startSetup();
  runApp(const App());
}
