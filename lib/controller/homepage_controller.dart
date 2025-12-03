// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';
import 'package:foodnest/controller/search/search.dart';
import 'package:foodnest/core/classes/statusRequset.dart';
import 'package:foodnest/core/constans/approutes.dart';
import 'package:foodnest/core/functions/Handledata.dart';
import 'package:foodnest/core/functions/fmc.dart';
import 'package:foodnest/data/dataremout/home.dart';
import 'package:foodnest/data/model/categories.dart';
import 'package:foodnest/data/model/items/items.dart';
import 'package:get/get.dart';

class Homeconteroller extends Searchconterller {
  
  @override
  late StatusRequset statusRequset;
  Homedata homedata = Homedata(Get.find());

  List<Itemsmodle> itemsdata = [];
  List<Categoriesmodel> categroisdata = [];
   List categories=[];

  late Itemsmodle items;
  late Categoriesmodel categoriesmodel;

  getdata() async {
    statusRequset = StatusRequset.laoding;
    var respons = await homedata.getdata();
    statusRequset = handledata(respons);
    if (statusRequset == StatusRequset.success) {
      if (respons["status"] == "success") {
        List items = respons["items"];
         categories = respons["categories"];
        categroisdata
            .addAll(categories.map((e) => Categoriesmodel.fromJson(e)));
        itemsdata.addAll(items.map((e) => Itemsmodle.fromJson(e)));
      } else {
        statusRequset == StatusRequset.failure;
      }
    }
    update();
  }

  gotoitemspage(int i, int catid) {
    Get.toNamed(Approutes.itemspage,
        arguments: {"categriose": categroisdata, "selected": i,"catid":catid});
      
  }

  gotocart(){
    Get.toNamed(Approutes.mycart);
  }













  @override
  void onInit() {
    getmassagefcm();
     search = TextEditingController();
    getdata();
    super.onInit();
  }
}
