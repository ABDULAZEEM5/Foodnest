import 'package:flutter/material.dart';
import 'package:foodnest/controller/onbording_conterller.dart';
import 'package:foodnest/viwe/widget/obording/buttononbording.dart';
import 'package:foodnest/viwe/widget/obording/controllainmated.dart';
import 'package:foodnest/viwe/widget/obording/silderbody.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';


class Onbording extends StatelessWidget {
  const Onbording({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Onbordingcontreller());
    return const Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 30,),
              Coustomonbordingbody(),
              Contrllerainmated(),
              SizedBox(height: 20,),
              BouttomOnbrdind()
            ],
          ),
        ));
  }
}
