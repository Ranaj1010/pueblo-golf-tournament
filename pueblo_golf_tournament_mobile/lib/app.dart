import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:pueblo_golf_tournament_mobile/screens/add-team-member-screen/screen.dart';
import 'package:pueblo_golf_tournament_mobile/screens/home-screen/screen.dart';
import 'package:pueblo_golf_tournament_mobile/screens/landing-screen/screen.dart';
import 'package:pueblo_golf_tournament_mobile/screens/register-new-player-screen/screen.dart';
import 'package:pueblo_golf_tournament_mobile/screens/register-team-screen/screen.dart';
import 'package:pueblo_golf_tournament_mobile/screens/registered-team-details-screen/screen.dart';
import 'package:pueblo_golf_tournament_mobile/screens/setup-player-profile-screen/screen.dart';
import 'package:pueblo_golf_tournament_mobile/screens/sign-in-screen/screen.dart';
import 'package:pueblo_golf_tournament_mobile/screens/sign-up-screen/screen.dart';
import 'package:pueblo_golf_tournament_mobile/screens/tournament-details-screen/screen.dart';

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
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 72, 109, 44)),
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
        "/signin": (context) => SignInScreen(),
        "/signup": (context) => SignUpScreen(),
        "/home": (context) => HomeScreen(),
        "/tournament-details": (context) => TournamentDetailScreen(),
        "/register-team": (context) => RegisterTeamScreen(),
        "/add-member": (context) => AddTeamMemberScreen(),
        "/register-player": (context) => RegisterNewPlayerScreen(),
        "/setup-player-profile": (context) => SetupPlayerProfileScreen(),
        "/registered-team-details": (context) => RegisteredTeamDetailsScreen()
      },
    );
  }
}
