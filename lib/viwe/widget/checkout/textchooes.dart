import 'package:flutter/widgets.dart';

class Textchooes extends StatelessWidget {
  final String text;
  const Textchooes({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }
}
