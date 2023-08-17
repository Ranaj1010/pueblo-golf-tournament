import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pueblo_golf_tournament_mobile/screens/leader-board-screen/controller.dart';

class LeaderBoardScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LeaderBoardScreenState();
}

class LeaderBoardScreenState extends State<LeaderBoardScreen> {
  final controller = Get.find<LeaderBoardScreenController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isInitializing.value ||
              controller.isLoadingLeaderBoard.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : DefaultTabController(
              length: controller.leaderBoard.length,
              child: Scaffold(
                appBar: AppBar(
                  title: const Text("Leader Board"),
                  centerTitle: false,
                  backgroundColor: Colors.white,
                  surfaceTintColor: Colors.white,
                  bottom: PreferredSize(
                    preferredSize: const Size(double.infinity, 50),
                    child: Wrap(
                      children: [
                        TabBar(
                          isScrollable: controller.leaderBoard.length > 5,
                          tabs: [
                            ...controller.leaderBoard.map(
                              (element) => Tab(
                                height: 50,
                                child: Container(
                                  margin: const EdgeInsets.only(top: 15),
                                  child: Column(
                                    children: [
                                      Text(
                                        element.division.name,
                                        style: const TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                body: TabBarView(
                  children: <Widget>[
                    ...controller.leaderBoard.map((leaderBoard) =>
                        SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 20),
                            child: Wrap(
                              runSpacing: 10,
                              children: [
                                leaderBoard.leaderBoard != null
                                    ? ListView.builder(
                                        itemCount:
                                            leaderBoard.leaderBoard!.length,
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) => Card(
                                          elevation: 10,
                                          child: ListTile(
                                            contentPadding:
                                                const EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 5,
                                                    left: 10,
                                                    right: 20),
                                            leading: CircleAvatar(
                                              child: Text(leaderBoard
                                                  .leaderBoard![index]
                                                  .team
                                                  .name[0]),
                                            ),
                                            title: Text(
                                              leaderBoard.leaderBoard![index]
                                                  .team.name,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            trailing: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  leaderBoard
                                                      .leaderBoard![index].score
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Theme.of(context)
                                                          .primaryColor),
                                                ),
                                                Text("Points")
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    : const Center(
                                        child: Text("No leader board yet."),
                                      )
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              )),
    );
  }
}
