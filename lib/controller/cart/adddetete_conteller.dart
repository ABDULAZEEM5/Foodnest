import 'package:foodnest/core/classes/statusRequset.dart';
import 'package:foodnest/core/functions/Handledata.dart';
import 'package:foodnest/core/servies/servies.dart';
import 'package:foodnest/data/dataremout/cart/adddelete.dart';
import 'package:foodnest/data/dataremout/cart/getcount.dart';
import 'package:get/get.dart';

class AddDeleteconterller extends GetxController {
  late StatusRequset statusRequset;
  AddDeletecart addDeletecart = AddDeletecart(Get.find());
  Getcountitem getcountitem = Getcountitem(Get.find());

  Myserives myserives = Get.find();

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
}
