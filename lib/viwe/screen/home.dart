import 'package:flutter/material.dart';
import 'package:foodnest/controller/homepage_controller.dart';
import 'package:foodnest/core/functions/handeldatarequset.dart';
import 'package:foodnest/viwe/widget/homepage/appbar.dart';
import 'package:foodnest/viwe/widget/homepage/categriosecoustem.dart';
import 'package:foodnest/viwe/widget/homepage/coustmitems.dart';
import 'package:foodnest/viwe/widget/homepage/posthome.dart';
import 'package:foodnest/viwe/widget/homepage/textcoustem.dart';
import 'package:foodnest/viwe/widget/homepage/textformfild.dart';
import 'package:foodnest/viwe/widget/searchpage/searchpage.dart';
import 'package:get/get.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Homeconteroller());
    return GetBuilder<Homeconteroller>(
      builder: (controller) => Scaffold(
          appBar: AppBar(
              toolbarHeight: 90,
              title: Appbarcoustm(
                onPressed: () {
                  controller.gotocart();
                },
              )),
          body: Container(
            margin: const EdgeInsets.all(12),
            child: ListView(
              children: [
                Column(
                  children: [
                    TextformfildeCustome(
                      onsearch: () {
                        controller.getsearch();
                      },
                      onChanged: (val) {
                        controller.checksearch(val);
                      },
                      mycontroller: controller.search!,
                    ),
                    HandledataRequset(
                        statusRequset: controller.statusRequset,
                        widget: controller.isSearch == true
                            ? SearchDataPage(
                                itemsmodel: controller.dataserch,
                              )
                            : Column(
                                children: [
                                  const Posthomepage(),
                                  Coustmcategrios(homeconteroller: controller),
                                  const Textcoustem(),
                                  Customitmes(
                                    controller: controller,
                                  )
                                ],
                              ))
                  ],
                )
              ],
            ),
          )),
    );
  }
}
