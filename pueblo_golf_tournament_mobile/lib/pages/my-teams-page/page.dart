import 'package:flutter/cupertino.dart';

class MyTeamsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyTeamsState();
  }
}

class MyTeamsState extends State<MyTeamsPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(child: Text("My Teams")),
    );
  }
}
