import 'package:flutter/material.dart';
import 'package:foodnest/core/classes/statusRequset.dart';
import 'package:foodnest/core/constans/approutes.dart';
import 'package:foodnest/core/functions/Handledata.dart';
import 'package:foodnest/data/dataremout/search.dart';
import 'package:foodnest/data/model/items/itemsviwe.dart';
import 'package:get/get.dart';

class Searchconterller extends GetxController {
  late TextEditingController? search;
  late StatusRequset statusRequset;
  SearchData searchData = SearchData(Get.find());
  List<Itemsviwe> dataserch = [];
  

  bool isSearch = false;

  checksearch(val) {
    if (val == "") {
      statusRequset = StatusRequset.none;
      isSearch = false;
    }
    update();
  }

  getsearch() {
    if (search!.text.isNotEmpty) {
      isSearch = true;
      getSearchdata();
    } else {
      Get.rawSnackbar(
          duration: const Duration(seconds: 1),
          snackPosition: SnackPosition.TOP,
          dismissDirection: DismissDirection.up,
          titleText: const Text("Wrong"),
          messageText: const Text("pleas enter your product ferst"));
    }
    update();
  }

  getSearchdata() async {
    statusRequset = StatusRequset.laoding;
    dataserch.clear();
    var respon = await searchData.getdata({"search": search!.text});
    statusRequset = handledata(respon);
    if (statusRequset == StatusRequset.success) {
      if (respon["status"] == "success") {
        List data = respon["data"];
        dataserch.addAll(data.map((e) => Itemsviwe.fromJson(e)));
      } else {
        statusRequset = StatusRequset.failure;
      }
    }
    update();
  }

  gotodetials(dataitemsdetails) {
    Get.toNamed(Approutes.itemsdetails,
        arguments: {"itemsdata":dataitemsdetails});
  }

  @override
  void onInit() {
    // getSearchdata();
    super.onInit();
  }
}
