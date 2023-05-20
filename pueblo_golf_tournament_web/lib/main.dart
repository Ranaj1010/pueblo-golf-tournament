import 'package:flutter/cupertino.dart';

import 'app.dart';
import 'configurations/flavors.dart';

void main() async {
  DevFlavorConfig().startSetup();
  runApp(const App());
}
