import 'package:flutter/material.dart';
import 'package:foodnest/core/constans/appcolors.dart';

class Sizeitme extends StatelessWidget {
  const Sizeitme({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("size: ",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Appcolors.grey,
                fontSize: 18)),
        const SizedBox(
          width: 10,
        ),
        CircleAvatar(
          maxRadius: 20,
          backgroundColor: Appcolors.scondecolor.withOpacity(0.60),
          child: Text(
            "8",
            style:
                TextStyle(height: -0.2, color: Appcolors.white, fontSize: 16),
          ),
        ),
        const SizedBox(
          width: 7,
        ),
        CircleAvatar(
          maxRadius: 20,
          backgroundColor: Appcolors.scondecolor.withOpacity(0.60),
          child: Text(
            "10",
            style:
                TextStyle(height: -0.2, color: Appcolors.white, fontSize: 16),
          ),
        ),
        const SizedBox(width: 7),
        CircleAvatar(
          maxRadius: 20,
          backgroundColor: Appcolors.scondecolor.withOpacity(0.60),
          child: Text(
            "14",
            style:
                TextStyle(height: -0.2, color: Appcolors.white, fontSize: 16),
          ),
        )
      ],
    );
  }
}
