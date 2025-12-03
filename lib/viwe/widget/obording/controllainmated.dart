import 'package:flutter/material.dart';
import 'package:foodnest/controller/onbording_conterller.dart';
import 'package:foodnest/core/constans/appcolors.dart';
import 'package:foodnest/data/datastatic/datastatic.dart';
import 'package:get/get.dart';

class Contrllerainmated extends StatelessWidget {
  const Contrllerainmated({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Onbordingcontreller());
    return Expanded(
        flex: 1,
        child: GetBuilder<Onbordingcontreller>(builder: (c) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                  mybordinglist.length,
                  (index) => AnimatedContainer(
                        decoration: BoxDecoration(
                            color: c.currentpage == index
                                ? Appcolors.primarycolor
                                : Color.fromARGB(70, 35, 35, 37),
                            borderRadius: BorderRadius.circular(5)),
                        margin: EdgeInsets.all(6),
                        width: 10,
                        height: 10,
                        duration: Duration(milliseconds: 80),
                      )),
              SizedBox(
                height: 50,
              ),
            ],
          );
        }));
  }
}
