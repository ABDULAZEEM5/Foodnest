import 'package:flutter/material.dart';
import 'package:foodnest/controller/search/search.dart';
import 'package:foodnest/core/classes/statusRequset.dart';
import 'package:foodnest/core/functions/Handledata.dart';
import 'package:foodnest/core/servies/servies.dart';
import 'package:foodnest/data/dataremout/items.dart';
import 'package:foodnest/data/model/categories.dart';
import 'package:foodnest/data/model/items/itemsviwe.dart';
import 'package:get/get.dart';

class Itemscontroller extends Searchconterller {
  @override
  // ignore: overridden_fields
  late StatusRequset statusRequset;
  Itemsdata itemsdata = Itemsdata(Get.find());
  List<Itemsviwe> data = [];
  Myserives myserives = Get.find();

  Map isFavorites = {};

  setFavorites(int id, int val) {
    isFavorites[id] = val;
  }

  late List<Categoriesmodel> categroisdata;
  late int selected;
  late int catid;

  chengeselect(int i, int catid1) {
    selected = i;
    catid = catid1;
    getdata(catid);
    update();
  }

  getdata(int ctaid) async {
    data.clear();
    update();
    statusRequset = StatusRequset.laoding;
    var respons = await itemsdata.getitems({
      "catid": catid.toString(),
      "userid": myserives.sharedPre.getString("id")
    });

    statusRequset = handledata(respons);
    if (statusRequset == StatusRequset.success) {
      if (respons["status"] == "success") {
        List items = respons["data"];
        data.addAll(items.map((e) => Itemsviwe.fromJson(e)));
      } else {
        statusRequset = StatusRequset.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    categroisdata = Get.arguments["categriose"];
    selected = Get.arguments["selected"];
    catid = Get.arguments["catid"];
    getdata(catid);
    super.onInit();
  }
}
