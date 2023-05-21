import 'package:flutter/cupertino.dart';

import 'app.dart';
import 'configurations/flavors.dart';

void main() {
  const env = String.fromEnvironment('env');

  switch (env) {
    case "dev":
      DevFlavorConfig().startSetup();
      break;
    case "alpha":
      AlphaFlavorConfig().startSetup();
      break;
    case "beta":
      BetaFlavorConfig().startSetup();
      break;
    case "prod":
      ProdFlavorConfig().startSetup();
      break;
    default:
      DevFlavorConfig().startSetup();
      break;
  }

  runApp(const App());
}
