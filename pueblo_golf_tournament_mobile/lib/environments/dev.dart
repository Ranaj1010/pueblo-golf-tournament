import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../app.dart';
import '../configurations/flavors.dart';

Future main() async {
  await dotenv.load(fileName: "/assets/environments/.env.dev");
  DevFlavorConfig().startSetup();
  runApp(const App());
}
