import 'package:flutter/material.dart';

class Appbarcoustam extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  const Appbarcoustam({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: onPressed, icon: const Icon(Icons.arrow_back)),
          Container(
            margin: const EdgeInsets.only(
              right: 150,
            ),
            alignment: Alignment.center,
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
