import 'package:flutter/material.dart';
import '../app.dart';
import '../configurations/flavors.dart';

void main() {
  ProdFlavorConfig().startSetup();
  runApp(const App());
}
