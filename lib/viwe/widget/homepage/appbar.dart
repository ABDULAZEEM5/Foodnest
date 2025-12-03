import 'package:flutter/material.dart';
import 'package:foodnest/core/constans/appcolors.dart';

class Appbarcoustm extends StatelessWidget {
  final void Function() onPressed;
  const Appbarcoustm({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  Row(
              children: [
                const Text(
                  "Order Your Favorite\nFast Food!",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 60,
                ),
                IconButton(
                  iconSize: 30,
                    color: Appcolors.white,
                    onPressed: onPressed,
                    icon: const Icon(Icons.shopping_cart)),
              ],
            );
  }
}