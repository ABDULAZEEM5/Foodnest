import 'package:flutter/material.dart';
import 'package:foodnest/core/classes/statusRequset.dart';
import 'package:foodnest/core/constans/approutes.dart';
import 'package:foodnest/core/functions/Handledata.dart';
import 'package:foodnest/core/servies/servies.dart';
import 'package:foodnest/data/dataremout/address/add.dart';
import 'package:get/get.dart';

class Adddetailsaddressconterll extends GetxController {
  Addadderssdata addadderssdata = Addadderssdata(Get.find());
  StatusRequset statusRequset = StatusRequset.none;
  Myserives myserives = Get.find();

  GlobalKey<FormState> formState = GlobalKey();

  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;

  late String lat;
  late String long;

  adddata() async {
    if (formState.currentState!.validate()) {
      statusRequset = StatusRequset.laoding;
      Map data = {
        "addressuserid": myserives.sharedPre.getString("id"),
        "addresscity": city!.text,
        "addressstreet": street!.text,
        "addressname": name!.text,
        "addresslat": lat,
        "addresslong": long,
      };
      var respon = await addadderssdata.getdata(data);
      statusRequset = handledata(respon);
      if (statusRequset == StatusRequset.success) {
        if (respon["status"] == "success") {
          Get.snackbar("success", "address had added");
          Get.offAllNamed(Approutes.homescreen);
        } else {
          statusRequset = StatusRequset.failure;
        }
        update();
      }
    }
  }

  @override
  void onInit() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    lat = Get.arguments["lat"];
    long = Get.arguments["long"];

    print("//////////////////////////////////////////");
    // print(lat);
    //  print(long);
    print("//////////////////////////////////////////");
    super.onInit();
  }
}
