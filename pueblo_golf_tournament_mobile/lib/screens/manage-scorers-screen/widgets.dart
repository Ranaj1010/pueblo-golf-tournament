import 'package:flutter/cupertino.dart';

import '../../widgets/brand-elevated-button.dart';

class EmptyScorersStateWidget extends StatelessWidget {
  final Function onPressGetStarted;
  const EmptyScorersStateWidget({super.key, required this.onPressGetStarted});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40),
      child: Center(
          child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        runSpacing: 10,
        alignment: WrapAlignment.center,
        children: [
          const Image(
            image: AssetImage("assets/empty.png"),
            height: 280,
          ),
          const Text(
            "It's empty out here",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const Text(
            "Setup the tournament scorers now in order to update the leaderboard.",
            textAlign: TextAlign.center,
          ),
          const Padding(padding: EdgeInsets.all(20)),
          BrandElevatedButton(
              onPressed: onPressGetStarted,
              title: "Get Started",
              loading: false)
        ],
      )),
    );
  }
}
