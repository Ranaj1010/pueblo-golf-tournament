import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

class DevFlavorConfig {
  DevFlavorConfig();
  startSetup() {
    var variables = {
      "baseUrl": "http://localhost:5064/",
    };

    return FlavorConfig(
        name: "DEV",
        color: Colors.red,
        location: BannerLocation.topEnd,
        variables: variables);
  }
}

class AlphaFlavorConfig {
  AlphaFlavorConfig();
  startSetup() {
    var variables = {
      "baseUrl": "http://localhost:5064/",
    };

    return FlavorConfig(
        name: "ALPHA",
        color: Colors.deepPurple,
        location: BannerLocation.topEnd,
        variables: variables);
  }
}

class BetaFlavorConfig {
  BetaFlavorConfig();
  startSetup() {
    var variables = {
      "baseUrl": "http://localhost:5064/",
    };

    return FlavorConfig(
        name: "BETA",
        color: Colors.lightGreen,
        location: BannerLocation.topEnd,
        variables: variables);
  }
}

class ProdFlavorConfig {
  ProdFlavorConfig();
  startSetup() {
    var variables = {
      "baseUrl": "http://localhost:5064/",
    };

    return FlavorConfig(
        name: "BETA",
        color: Colors.black,
        location: BannerLocation.topEnd,
        variables: variables);
  }
}
