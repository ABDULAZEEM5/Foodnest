import 'package:flutter/material.dart';
import 'package:foodnest/controller/onbording_conterller.dart';
import 'package:foodnest/core/constans/appcolors.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class BouttomOnbrdind extends GetView<Onbordingcontreller> {
  const BouttomOnbrdind({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Onbordingcontreller());
    return Container(
        margin: EdgeInsets.only(bottom: 60),
        width: 330,
        decoration: BoxDecoration(
            color: Appcolors.scondecolor,
            borderRadius: BorderRadius.circular(20)),
        child: TextButton(
            onPressed: () {
              controller.next();
            },
            child: Text(
              "Next",
              style: TextStyle(color: Appcolors.white),
            )));
  }
}
