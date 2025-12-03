import 'package:flutter/material.dart';
import 'package:foodnest/controller/search/search.dart';
import 'package:foodnest/core/classes/statusRequset.dart';
import 'package:foodnest/core/functions/Handledata.dart';
import 'package:foodnest/data/dataremout/offers/offers.dart';
import 'package:foodnest/data/model/items/itemsviwe.dart';
import 'package:get/get.dart';

class Offersconterller extends Searchconterller {
  @override
  late StatusRequset statusRequset;
  OffersData offersData = OffersData(Get.find());
   List<Itemsviwe> data = [];
    Map isFavorites = {};

  setFavorites(int id, int val) {
    isFavorites[id] = val;
  }

  getdata() async {
    statusRequset = StatusRequset.laoding;
    var respons = await offersData.getdata({});
    statusRequset = handledata(respons);
    if (statusRequset == StatusRequset.success) {
      if (respons["status"] == "success") {
        List items = respons["data"];
        print("/////////////////////$items///////////////");
        data.addAll(items.map((e) => Itemsviwe.fromJson(e)));
      } else {
        statusRequset == StatusRequset.failure;
      }
    }
    update();
  }


  @override
  void onInit() {
    search = TextEditingController();
    getdata();
    super.onInit();
  }
}
