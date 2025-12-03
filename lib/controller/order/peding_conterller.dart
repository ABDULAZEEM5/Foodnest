import 'package:flutter/widgets.dart';
import 'package:foodnest/core/classes/statusRequset.dart';
import 'package:foodnest/core/constans/approutes.dart';
import 'package:foodnest/core/functions/Handledata.dart';
import 'package:foodnest/core/servies/servies.dart';
import 'package:foodnest/data/dataremout/order/peding.dart';
import 'package:foodnest/data/model/order/order.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class Pedingconterller extends GetxController {
  PedingData pedingData = PedingData(Get.find());
  late StatusRequset statusRequset;
  Myserives myserives = Get.find();
  List<Ordermodel> data = [];

  time(String time) {
    Jiffy.parse(time);
  }

  payementmethood(String val) {
    if (val == "0") {
      return "Cash";
    } else {
      return "Card";
    }
  }

  
  orderstatus(String val) {
    if (val == "0") {
      return "pending";
    }
    if (val == "1") {
      return "Approve";
    }
    if (val == "2") {
      return " on parper";
    }
      if (val == "3") {
      return " in a way ";
    }
    if (val == "4") {
      return " Delivered ";
    }
  }

  delverytype(String val) {
    if (val == "0") {
      return "serivce";
    } else {
      return "Delivery";
    }
  }

  getdata() async {
    data.clear();
    statusRequset = StatusRequset.laoding;
    update();
    var respon = await pedingData
        .getdata({"userid": myserives.sharedPre.getString("id")});
    statusRequset = handledata(respon);
    if (statusRequset == StatusRequset.success) {
      if (respon["status"] == "success") {
        List dataorder = respon["data"];
        data.addAll(dataorder.map((e) => Ordermodel.fromJson(e)));
      } else {
        statusRequset = StatusRequset.failure;
      }
    }
    update();
  }

  deletedata(String orderid) async {
    data.clear();
    statusRequset = StatusRequset.laoding;
    update();
    var respon = await pedingData.deletedata({"orderid": orderid});
    statusRequset = handledata(respon);
    if (statusRequset == StatusRequset.success) {
      if (respon["status"] == "success") {
        Get.defaultDialog(title: "success",content: Text("the order deleted"));
        getdata();
      } else {
        print("////////////////rtrrr////////////////////");
          Get.defaultDialog(title: "erorr",content: Text("something wrong"));
        statusRequset = StatusRequset.failure;
      }
    }
    update();
  }

  gotodtetials(ordermodel) {
    Get.toNamed(Approutes.orderdetails, arguments: {"ordermodel": ordermodel});
  }

  refreshorderpage() {
    getdata();
  }

  @override
  void onInit() {
    getdata();
    super.onInit();
  }
}
