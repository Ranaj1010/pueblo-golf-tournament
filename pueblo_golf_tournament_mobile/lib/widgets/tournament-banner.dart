import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pueblo_golf_tournament_mobile/models/tournament.dart';

class TournamentBanner extends StatelessWidget {
  final Tournament? tournament;
  final String name;
  final Function(Tournament tournament) onTap;
  const TournamentBanner(
      {super.key,
      required this.name,
      required this.onTap,
      required this.tournament});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: double.infinity,
      height: 150.0,
      child: GestureDetector(
        onTap: () => onTap(tournament!),
        child: Card(
            semanticContainer: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 5,
            child: Stack(
              fit: StackFit.expand,
              children: [
                const Image(
                  image: AssetImage('assets/background-tournament.png'),
                  fit: BoxFit.fill,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 10, 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Colors.white),
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
