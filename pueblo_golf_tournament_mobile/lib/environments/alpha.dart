import 'package:flutter/material.dart';

import '../app.dart';
import '../configs/flavor-config.dart';

void main() {
  AlphaFlavorConfig().startSetup();
  runApp(const App());
}
