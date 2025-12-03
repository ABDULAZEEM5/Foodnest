import 'package:flutter/material.dart';
import 'package:foodnest/core/classes/statusRequset.dart';
import 'package:foodnest/core/constans/approutes.dart';
import 'package:foodnest/core/functions/Handledata.dart';
import 'package:foodnest/core/servies/servies.dart';
import 'package:foodnest/data/dataremout/cart/adddelete.dart';
import 'package:foodnest/data/dataremout/cart/coupon.dart';
import 'package:foodnest/data/dataremout/cart/getcount.dart';
import 'package:foodnest/data/dataremout/cart/viwe.dart';
import 'package:foodnest/data/model/cart.dart';
import 'package:foodnest/data/model/coupon.dart';
import 'package:get/get.dart';

class Viwecartconterller extends GetxController {
  StatusRequset? statusRequset;
  Viwecartdata viwecartdata = Viwecartdata(Get.find());
  Coupondata coupondata = Coupondata(Get.find());

  late TextEditingController textcoupon;
  late CouponModel couponModel;
  int coupondiscout = 0;
  int couponid = 0;
  String? couponname;
  Myserives myserives = Get.find();

  List<Cartmodel> data = [];
  int sumpric = 0;
  String sumcount = "0";

//////////////////////add and delete cart //////////////////////////
  ///  late StatusRequset statusRequset;
  AddDeletecart addDeletecart = AddDeletecart(Get.find());
  Getcountitem getcountitem = Getcountitem(Get.find());

  adddata(String cartitem) async {
    statusRequset = StatusRequset.laoding;
    var respon = await addDeletecart.adddata({
      "cartitem": cartitem,
      "cartuser": myserives.sharedPre.getString("id")
    });
    statusRequset = handledata(respon);
    if (statusRequset == StatusRequset.success) {
      if (respon["status"] == "success") {
        Get.snackbar("success", "items is add to cart");
      } else {
        statusRequset = StatusRequset.failure;
      }
    }
    update();
  }

  deletedata(String cartitem) async {
    statusRequset = StatusRequset.laoding;
    var respon = await addDeletecart.deletedata({
      "cartitem": cartitem,
      "cartuser": myserives.sharedPre.getString("id")
    });
    statusRequset = handledata(respon);
    if (statusRequset == StatusRequset.success) {
      if (respon["status"] == "success") {
        Get.snackbar("success", "items is detete from cart");
      } else {
        statusRequset = StatusRequset.failure;
      }
    }
    update();
  }

///////////////////////////////////////////////////////

  getdata() async {
    statusRequset = StatusRequset.laoding;
    data.clear();
    update();
    var respos = await viwecartdata
        .viwedata({"userid": myserives.sharedPre.getString("id")});
    statusRequset = handledata(respos);
    if (statusRequset == StatusRequset.success) {
      if (respos["status"] == "success") {
        List datacart = respos["data"];
        var allpriceAcount = respos["allpriceAcount"];
        data.addAll(datacart.map((e) => Cartmodel.fromJson(e)));
        sumpric = allpriceAcount["allprice"];
        sumcount = allpriceAcount["totlcount"];
      } else {
        statusRequset = StatusRequset.failure;
      }
    }
    update();
  }

  refreshdata() {
    getdata();
    sumpric = 0;
    update();
  }

  checkcoupon() async {
    statusRequset = StatusRequset.laoding;
    var respon = await coupondata.getdata({"couponname": textcoupon.text});
    statusRequset = handledata(respon);
    if (statusRequset == StatusRequset.success) {
      if (respon["status"] == "success") {
        Map<String, dynamic> datac = respon["data"];
        couponModel = CouponModel.fromJson(datac);
        couponname=couponModel.couponName;
         couponid=int.parse(couponModel.couponId.toString());
        coupondiscout=int.parse(couponModel.couponDiscount.toString());
        
      } else {
        Get.snackbar("woring", "the coupon is expirt");
        statusRequset = StatusRequset.success;
        couponname=null;
        coupondiscout=0;
        couponid=0;
      }
    }
    update();
  }

 double get gettotalprice => sumpric-(sumpric*coupondiscout/100);
 
 
gotocheckout(){
  if (data.isNotEmpty) {
      Get.toNamed(Approutes.checkout,arguments: {
        "couponid":couponid,
        "coupondiscout" :coupondiscout,
        "price":sumpric
      });
  }

}


  @override
  void onInit() {
    getdata();
    textcoupon = TextEditingController();

    super.onInit();
  }
}
