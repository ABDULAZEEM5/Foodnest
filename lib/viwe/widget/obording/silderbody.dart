import 'package:flutter/material.dart';
import 'package:foodnest/controller/onbording_conterller.dart';
import 'package:foodnest/data/datastatic/datastatic.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class Coustomonbordingbody extends StatelessWidget {
  const Coustomonbordingbody({super.key});

  @override
  Widget build(BuildContext context) {
    Onbordingcontreller controller = Get.put(Onbordingcontreller());
    return Expanded(
      flex: 5,
      child: PageView.builder(
        controller: controller.pageController,
        onPageChanged: (value) {
          controller.changepage(value);
        },
        itemCount: mybordinglist.length,
        itemBuilder: (BuildContext context, int i) => Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.asset(
                // height: 300,
                mybordinglist[i].image,
                fit: BoxFit.cover),
            const SizedBox(
              height: 20,
            ),
            Text(mybordinglist[i].title,
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(
              height: 20,
            ),
            Text(
              mybordinglist[i].body,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall,
            )
          ],
        ),
      ),
    );
  }
}
