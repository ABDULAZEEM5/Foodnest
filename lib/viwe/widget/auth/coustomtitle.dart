import 'package:flutter/material.dart';

class Coustmtitle extends StatelessWidget {
  final Widget? child;
  const Coustmtitle({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 30, bottom: 10),
        alignment: Alignment.centerLeft,
        child: child);
  }
}
