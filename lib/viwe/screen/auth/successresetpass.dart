import 'package:flutter/material.dart';
import 'package:foodnest/core/constans/appcolors.dart';
import 'package:foodnest/core/constans/approutes.dart';
import 'package:foodnest/viwe/widget/auth/costumboutton.dart';
import 'package:get/get.dart';

class Successpage extends StatelessWidget {
  const Successpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  tileMode: TileMode.clamp,
                  colors: [
                Appcolors.scondecolor,
                Appcolors.white.withOpacity(0.100),
                Appcolors.scondecolor.withOpacity(0.6),
              ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Text("Success",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              Icon(
                Icons.check_circle_outline,
                size: 200,
                weight: 20,
                color: Appcolors.scondecolor,
              ),
              const SizedBox(height: 10),
              const Text(" Password has changed ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 390),
              CoustomloginButton(text: 'Go to login', onPressed: () {
                Get.offNamed(Approutes.login);
              }),
            ],
          )),
    );
  }
}
