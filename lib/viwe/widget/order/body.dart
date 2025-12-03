import 'package:flutter/material.dart';

class Orderbody extends StatelessWidget {
  final String text1;
  final String text2;

  const Orderbody({
    super.key,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text1, style: Theme.of(context).textTheme.labelSmall),
        Text(
          text2,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    );
  }
}
