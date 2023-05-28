import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayerForm extends StatelessWidget {
  final TextEditingController homeClubTextController;
  final TextEditingController worldHandicapSystemIdTextController;

  const PlayerForm(
      {super.key,
      required this.homeClubTextController,
      required this.worldHandicapSystemIdTextController});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 20,
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: "Home Club",
          ),
          controller: homeClubTextController,
        ),
        TextField(
          decoration: const InputDecoration(
              hintText: "World Handicap System Id",
              helperText: "If no WHS, enter '0'"),
          controller: worldHandicapSystemIdTextController,
        ),
      ],
    );
  }
}

class SetupProfileSuccess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        children: [
          Text(
            "You have successfully saved your profile.",
            style: TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
