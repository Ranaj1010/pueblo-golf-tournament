import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../components/slide-route.dart';
import 'login-screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  bool start = false;

  @override
  void initState() {
    super.initState();
    initialize();
  }

  initialize() async {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      setState(() {
        start = true;
      });
      Future.delayed(const Duration(milliseconds: 800)).then((value) {
        Navigator.push(context, SlideTopRoute(page: (const LoginScreen())));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(0.8, 1),
          colors: <Color>[
            Color.fromARGB(255, 24, 193, 123),
            Color.fromARGB(255, 167, 231, 203)
          ], // Gradient from https://learnui.design/tools/gradient-generator.html
          tileMode: TileMode.mirror,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Center(
              child: OverflowBox(
            maxHeight: MediaQuery.of(context).size.longestSide * 2,
            maxWidth: MediaQuery.of(context).size.longestSide * 2,
            child: AnimatedContainer(
              curve: Curves.easeIn,
              duration: Duration(milliseconds: 700),
              width: start ? MediaQuery.of(context).size.longestSide * 2 : 50,
              height: start ? MediaQuery.of(context).size.longestSide * 2 : 50,
              decoration: BoxDecoration(
                  color: /*start ?*/ Colors.white /*: Colors.black */,
                  shape: BoxShape.circle),
              child: Center(
                child: start
                    ? Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image(
                          image: AssetImage('assets/logo-golf-big.png'),
                          height: 40,
                        ),
                      )
                    : CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image(
                            image: AssetImage('assets/logo-golf-big.png'),
                          ),
                        )),
              ),
            ),
          )),
          SpinKitRing(
            color: Colors.white,
            lineWidth: 2,
            size: 70,
          ),
        ],
      ),
    ));
  }
}
  // @override
  // Widget build(BuildContext context) {
  //   return SafeArea(
  //       child: Scaffold(
  //     backgroundColor: Colors.cyanAccent,
  //     body: Container(
  //       decoration: const BoxDecoration(
  //         gradient: LinearGradient(
  //           begin: Alignment.topLeft,
  //           end: Alignment(0.8, 1),
  //           colors: <Color>[
  //             Color.fromARGB(255, 37, 145, 240),
  //             Color.fromARGB(255, 12, 212, 219),
  //             Color.fromARGB(255, 7, 133, 187),
  //           ], // Gradient from https://learnui.design/tools/gradient-generator.html
  //           tileMode: TileMode.mirror,
  //         ),
  //       ),
  //       child: Center(
  //         child: Stack(alignment: Alignment.center, children: [
  //           SpinKitRing(color: Colors.white, lineWidth: 2, size: 60),
  //           CircleAvatar(
  //               backgroundColor: Colors.white,
  //               child: Padding(
  //                 padding: EdgeInsets.all(8.0),
  //                 child: Image(
  //                   image: AssetImage('assets/logo-only.png'),
  //                 ),
  //               ))
  //         ]),
  //       ),
  //     ),
  //   ));
  // }
// }
