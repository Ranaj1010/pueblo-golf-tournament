import 'package:flutter/material.dart';
import '../app.dart';
import '../configurations/flavors.dart';

void main() {
  BetaFlavorConfig().startSetup();
  runApp(const App());
}
