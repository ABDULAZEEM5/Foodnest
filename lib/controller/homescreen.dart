import 'package:flutter/material.dart';
import 'package:foodnest/viwe/screen/favorite.dart';
import 'package:foodnest/viwe/screen/home.dart';
import 'package:foodnest/viwe/screen/offerts.dart';
import 'package:foodnest/viwe/screen/setting.dart';
import 'package:get/get.dart';

class Homescrrenconterrlor extends GetxController {
  int currentpage = 0;

  changpage(int i) {
    currentpage = i;
    update();
  }

  List<IconData> icon = [
    Icons.home,
    Icons.favorite,
    Icons.settings,
    Icons.discount
  ];

  List<String> titele = [
    "home",
    "favorite",
    "setting",
    "offerst",
  ];

  List pages = [
    const Homepage(),
    const Favorite(),
    const Offerst(),
    const Setting(),
  ];
}
