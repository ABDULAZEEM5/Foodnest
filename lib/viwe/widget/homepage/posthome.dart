import 'package:flutter/material.dart';
import 'package:foodnest/core/constans/appcolors.dart';
import 'package:foodnest/core/constans/appimages.dart';

class Posthomepage extends StatelessWidget {
  const Posthomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Appcolors.scondecolor.withOpacity(0.88),
          borderRadius: BorderRadius.circular(28)),
      margin: const EdgeInsets.only(
        top: 20,
      ),
      height: 180,
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Positioned(
              right: -35,
              bottom: 20,
              child: Image.asset(
                Appimages.bost,
                width: 200,
              )),
          Container(
              margin: const EdgeInsets.only(top: 20, left: 15),
              child: Text(
                "Grab Our Exclusive\nFood Discount Now!",
                style: TextStyle(
                    shadows: const [
                      Shadow(
                          blurRadius: 2,
                          color: Colors.black,
                          offset: Offset(1, 1))
                    ],
                    color: Appcolors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}
