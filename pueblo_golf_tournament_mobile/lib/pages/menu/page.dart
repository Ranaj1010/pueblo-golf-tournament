import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pueblo_golf_tournament_mobile/api/authentication/authentication-controller.dart';
import 'package:pueblo_golf_tournament_mobile/data/context.dart';
import 'package:pueblo_golf_tournament_mobile/pages/dashboard-page/controller.dart';
import 'package:pueblo_golf_tournament_mobile/pages/menu/controller.dart';

class MenuPage extends StatelessWidget {
  final controller = Get.find<MenuPageController>();
  final dataContextController = Get.find<DataContextController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Image(
                    image:
                        AssetImage("assets/default-tournament-background.png")),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 240, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 90,
                      width: 90,
                      child: CircleAvatar(
                          child: CircleAvatar(
                        child: Text(dataContextController.authenticatedData
                                .value!.personalDetails!.firstName[0] +
                            dataContextController.authenticatedData.value!
                                .personalDetails!.lastName[0]),
                      )),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            "${dataContextController.authenticatedData.value!.personalDetails!.firstName} ${dataContextController.authenticatedData.value!.personalDetails!.middleName} ${dataContextController.authenticatedData.value!.personalDetails!.lastName}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                          dataContextController.authenticatedData.value!
                                      .account!.accountType ==
                                  2
                              ? Text(
                                  "${dataContextController.playerProfile.value!.player.homeClub}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 16),
                                )
                              : Padding(padding: EdgeInsets.all(0))
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Wrap(
              runSpacing: 10,
              children: [
                SizedBox(
                    width: double.infinity,
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      semanticContainer: true,
                      child: InkWell(
                        onTap: () => controller.signOut(),
                        child: ListTile(
                          title: Text(
                            "Sign Out",
                          ),
                          trailing: Icon(Icons.logout),
                        ),
                      ),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
