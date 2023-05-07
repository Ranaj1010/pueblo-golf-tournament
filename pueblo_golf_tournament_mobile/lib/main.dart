import 'package:flutter/cupertino.dart';

import 'app.dart';
import 'configs/flavor-config.dart';

void main() async {
  DevFlavorConfig().startSetup();
  runApp(const App());
}
