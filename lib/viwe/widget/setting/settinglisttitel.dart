import 'package:flutter/material.dart';
import 'package:foodnest/core/constans/appcolors.dart';

class Listtitlecoustem extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function() onTap;
  const Listtitlecoustem(
      {super.key, required this.text, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Appcolors.white.withOpacity(1),
      child: ListTile(
        onTap: onTap,
        title: Text(text),
        leading: Icon(icon),
      ),
    );
  }
}
