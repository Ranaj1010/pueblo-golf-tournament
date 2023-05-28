import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeAppBarLeading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: CircleAvatar(
          child: Image(
        image: AssetImage(
          "assets/sample-avatar.png",
        ),
        fit: BoxFit.fill,
      )),
    );
  }
}
