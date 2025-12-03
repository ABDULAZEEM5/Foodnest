import 'package:flutter/material.dart';
import 'package:foodnest/core/constans/approutes.dart';
import 'package:foodnest/core/servies/servies.dart';
import 'package:foodnest/data/datastatic/datastatic.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Onbordingcontreller extends GetxController {
     Myserives myserives= Get.find();
  int currentpage = 0;
  late PageController pageController;

  changepage(value) {
    currentpage = value;
    update();
  }

  next() {
    currentpage++;
    if (currentpage > mybordinglist.length - 1) {
      Get.toNamed(Approutes.login);
      myserives.sharedPre.setString("step", "1");
    }
    pageController.animateToPage(currentpage,
        duration: const Duration(milliseconds: 90), curve: Curves.easeInOut);
  }

  @override
  void onInit() {
    pageController = PageController();
    //next();
    super.onInit();
  }
}
