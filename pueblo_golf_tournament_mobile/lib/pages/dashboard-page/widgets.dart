import 'package:blur/blur.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../data/context.dart';
import '../../dto/model/tournament-dto.dart';

class DashboardPlayerProfile extends StatelessWidget {
  final dataContextController = Get.find<DataContextController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome back"),
            Text(
              dataContextController
                  .authenticatedData.value!.personalDetails!.firstName,
              style: TextStyle(fontSize: 45, fontWeight: FontWeight.w800),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardTournamentList extends StatelessWidget {
  final List<TournamentDto> tournaments;
  final Function(TournamentDto) selectTournament;
  final bool loadingData;
  const DashboardTournamentList(
      {super.key,
      required this.tournaments,
      required this.selectTournament,
      required this.loadingData});

  @override
  Widget build(BuildContext context) {
    return loadingData
        ? const CircularProgressIndicator()
        : ListView.builder(
            primary: true,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(0),
            itemCount: tournaments.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  height: 255,
                  child: GestureDetector(
                      onTap: () => selectTournament(tournaments[index]),
                      child: TournamentCard(
                        tournament: tournaments[index],
                        onSelectTournament: selectTournament,
                      )));
            });
  }
}

class TournamentCard extends StatelessWidget {
  final TournamentDto tournament;
  final Function(TournamentDto tournament) onSelectTournament;

  const TournamentCard(
      {super.key, required this.tournament, required this.onSelectTournament});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      height: 255,
      child: GestureDetector(
        onTap: () => onSelectTournament(tournament),
        child: Card(
            borderOnForeground: true,
            semanticContainer: true,
            elevation: 10,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Stack(
              children: [
                tournament.bannerPhoto == null
                    ? Blur(
                        blur: 0.5,
                        blurColor: Colors.black,
                        child: Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    "assets/default-tournament-background.png",
                                  ),
                                  fit: BoxFit.fill)),
                        ))
                    : Blur(
                        blur: 0.5,
                        blurColor: Colors.black,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                    tournament.bannerPhoto ??
                                        "assets/default-tournament-background.png",
                                  ),
                                  fit: BoxFit.fill)),
                        )),
                Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '${tournament.name}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18),
                        ),
                        Wrap(
                          spacing: 10,
                          direction: Axis.horizontal,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 18,
                              color: Colors.white,
                            ),
                            Text('${tournament.venuePlace}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    fontSize: 16)),
                          ],
                        )
                      ],
                    ))
              ],
            )),
      ),
    );
  }
}
