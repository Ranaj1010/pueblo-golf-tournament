import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

class DevFlavorConfig {
  DevFlavorConfig();
  startSetup() {
    var variables = {
      "baseUrl": "127.0.0.1:5001",
    };

    return FlavorConfig(
        name: "DEV",
        color: Colors.red,
        location: BannerLocation.bottomEnd,
        variables: variables);
  }
}

class AlphaFlavorConfig {
  AlphaFlavorConfig();
  startSetup() {
    var variables = {
      "baseUrl": "172.104.102.236:5064",
    };

    return FlavorConfig(
        name: "ALPHA",
        color: Colors.deepPurple,
        location: BannerLocation.bottomEnd,
        variables: variables);
  }
}

class BetaFlavorConfig {
  BetaFlavorConfig();
  startSetup() {
    var variables = {
      "baseUrl": "172.104.102.236:5064",
    };

    return FlavorConfig(
        name: "BETA",
        color: Colors.lightGreen,
        location: BannerLocation.bottomEnd,
        variables: variables);
  }
}

class ProdFlavorConfig {
  ProdFlavorConfig();
  startSetup() {
    var variables = {
      "baseUrl": "172.104.102.236:5064",
    };

    return FlavorConfig(
        name: "PROD",
        color: Colors.black,
        location: BannerLocation.bottomEnd,
        variables: variables);
  }
}
