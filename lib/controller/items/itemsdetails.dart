import 'package:foodnest/core/classes/statusRequset.dart';
import 'package:foodnest/core/constans/approutes.dart';
import 'package:foodnest/core/functions/Handledata.dart';
import 'package:foodnest/core/servies/servies.dart';
import 'package:foodnest/data/dataremout/cart/adddelete.dart';
import 'package:foodnest/data/dataremout/cart/getcount.dart';
import 'package:foodnest/data/model/items/itemsviwe.dart';
import 'package:get/get.dart';

class Itemsdetailscontrller extends GetxController {
  late StatusRequset statusRequset;
  late Itemsviwe itemsdata;
  late int itemcount = 0;

  ///////////////////////addcart//////////////////////
  AddDeletecart addDeletecart = AddDeletecart(Get.find());
  Getcountitem getcountitem = Getcountitem(Get.find());
  Myserives myserives = Get.find();

  inonitl() async {
    statusRequset = StatusRequset.laoding;
    itemsdata = Get.arguments["itemsdata"];
    itemcount = await getcountitemdata(itemsdata.itemsId.toString());
    statusRequset = StatusRequset.success;
    update();
  }


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

  getcountitemdata(String cartitem) async {
    statusRequset = StatusRequset.laoding;
    var respon = await getcountitem.getcountdata({
      "cartitem": cartitem,
      "cartuser": myserives.sharedPre.getString("id")
    });
    statusRequset = handledata(respon);
    if (statusRequset == StatusRequset.success) {
      if (respon["status"] == "success") {
        int itemcount = 0;
        itemcount = respon["data"];
        return itemcount;
      } else {
        statusRequset = StatusRequset.failure;
      }
    }
    update();
  }

  add() {
    statusRequset = StatusRequset.laoding;
    adddata(itemsdata.itemsId.toString());
    itemcount++;
    statusRequset = StatusRequset.success;
    update();
  }

  delete() {
    if (itemcount > 0) {
      statusRequset = StatusRequset.laoding;
      deletedata(itemsdata.itemsId.toString());
      itemcount--;
      statusRequset = StatusRequset.success;
      update();
    }
  }

  gotocart() {
    Get.toNamed(Approutes.mycart);
  }

  @override
  void onInit() {
    inonitl();
    super.onInit();
  }
}
