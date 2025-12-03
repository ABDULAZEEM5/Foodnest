import 'package:flutter/material.dart';

class Textcoustem extends StatelessWidget {
  const Textcoustem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        child: Text(
          "Recommended For you",
          style: Theme.of(context).textTheme.bodyLarge,
        ));
  }
}
