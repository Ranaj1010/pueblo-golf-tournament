import 'package:flutter/material.dart';

import '../app.dart';
import '../configurations/flavors.dart';

void main() {
  AlphaFlavorConfig().startSetup();
  runApp(const App());
}
