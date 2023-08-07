import 'package:flutter/cupertino.dart';

class HorizontalCardsTitle extends StatelessWidget {
  final String title;
  const HorizontalCardsTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, bottom: 10, top: 10),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
