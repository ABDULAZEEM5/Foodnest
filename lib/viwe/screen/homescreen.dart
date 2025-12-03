import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:foodnest/controller/homescreen.dart';
import 'package:foodnest/core/constans/appcolors.dart';
import 'package:foodnest/core/functions/exitapp.dart';
import 'package:get/get.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Homescrrenconterrlor());
    return GetBuilder<Homescrrenconterrlor>(
      builder: (controller) => PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          exitapp();
        },
        child: Scaffold(
          bottomNavigationBar: ConvexAppBar(
              initialActiveIndex: controller.currentpage,
              onTap: (i) {
                controller.changpage(i);
                print(controller.currentpage);
              },
              backgroundColor: Appcolors.scondecolor,
              items: const [
                TabItem(icon: Icon(Icons.home), title: "home"),
                TabItem(icon: Icon(Icons.favorite), title: "favorite"),
                TabItem(icon: Icon(Icons.discount), title: "discount"),
                TabItem(icon: Icon(Icons.settings), title: "settings"),
              ]),
          body: controller.pages.elementAt(controller.currentpage),
        ),
      ),
    );
  }
}
