import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BrandSecondaryButton extends StatelessWidget {
  final Function? onPressed;
  final String title;
  final bool loading;

  const BrandSecondaryButton(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.loading});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: onPressed == null || loading ? null : () => onPressed!(),
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 240, 221, 191),
              foregroundColor: Colors.black,
              padding: const EdgeInsets.all(14.0)),
          icon: loading
              ? Container(
                  width: 20,
                  height: 20,
                  padding: const EdgeInsets.all(0.0),
                  child: const CircularProgressIndicator(
                    color: Colors.black,
                    strokeWidth: 3,
                  ),
                )
              : const Padding(padding: EdgeInsets.all(0)),
          label: Text(title),
        ));
  }
}
