import 'package:flutter/widgets.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:pueblo_golf_tournament_mobile/screens/account-registration-success-screen.dart';
import 'package:pueblo_golf_tournament_mobile/screens/home-screen.dart';
import 'package:pueblo_golf_tournament_mobile/screens/login-screen.dart';
import 'package:pueblo_golf_tournament_mobile/screens/account-registration-screen.dart';
import 'package:pueblo_golf_tournament_mobile/screens/splash-screen.dart';

import 'bindings/initial-binding.dart';
import 'configs/theme-configs.dart';

class App extends StatelessWidget {
  // final CameraDescription cameraDescription;
  // const MyApp({Key? key, required this.cameraDescription}) : super(key: key);
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pueblo Golf Tournament',
      initialBinding: InitialBinding(),
      theme: CompanyTheme.getTheme(),
      initialRoute: '/',
      supportedLocales: [
        const Locale("en"),
        const Locale("es"),
      ],
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/account-registration': (context) => const AccountRegistrationScreen(),
        '/account-registration-success': (context) =>
            const AccountRegistrationSuccessScreen(),
      },
    );
  }
}
