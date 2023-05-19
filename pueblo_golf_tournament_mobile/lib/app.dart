import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:pueblo_golf_tournament_mobile/screens/add-member-screen.dart';
import 'package:pueblo_golf_tournament_mobile/screens/home-screen.dart';
import 'package:pueblo_golf_tournament_mobile/screens/landing-screen.dart';
import 'package:pueblo_golf_tournament_mobile/screens/login-screen.dart';
import 'package:pueblo_golf_tournament_mobile/screens/register-screen.dart';
import 'package:pueblo_golf_tournament_mobile/screens/register-team-screen.dart';
import 'package:pueblo_golf_tournament_mobile/screens/register-team-success.dart';
import 'package:pueblo_golf_tournament_mobile/screens/registration-success-screen.dart';
import 'package:pueblo_golf_tournament_mobile/screens/tournament-detail-screen.dart';

import 'configurations/bindings.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialBinding: AppBindings(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: const TextStyle(fontSize: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          contentPadding: EdgeInsets.all(16),
          fillColor: Color.fromARGB(255, 233, 233, 233),
        ),
      ),
      routes: {
        "/": (context) => LandingScreen(),
        "/login": (context) => LoginScreen(),
        "/register": (context) => RegisterScreen(),
        "/home": (context) => HomeScreen(),
        "/registration-success": (context) => RegistrationSuccessScreen(),
        "/tournament-details": (context) => TournamentDetailScreen(),
        "/register-team": (context) => RegisterTeamScreen(),
        "/registration-add-member": (context) => AddMemberScreen(),
        "/registration-team-success": (context) =>
            RegistrationTeamSuccessScreen()
      },
    );
  }
}
