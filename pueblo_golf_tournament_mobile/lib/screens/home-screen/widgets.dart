import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeAppBarLeading extends StatelessWidget {
  final String name;

  const HomeAppBarLeading({super.key, required this.name});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: CircleAvatar(
        child: Text(
          name,
          style: const TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}
