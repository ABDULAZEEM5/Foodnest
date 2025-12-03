import 'package:flutter/material.dart';

class Bodyname extends StatelessWidget {
  final String text;
  const Bodyname({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        child: Text(
         text,
          style: Theme.of(context).textTheme.labelSmall,
        ));
  }
}
