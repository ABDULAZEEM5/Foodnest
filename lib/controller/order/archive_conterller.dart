import 'package:foodnest/core/classes/statusRequset.dart';
import 'package:foodnest/core/constans/approutes.dart';
import 'package:foodnest/core/functions/Handledata.dart';
import 'package:foodnest/core/servies/servies.dart';
import 'package:foodnest/data/dataremout/order/archive.dart';
import 'package:foodnest/data/dataremout/order/rating.dart';
import 'package:foodnest/data/model/order/order.dart';
import 'package:get/get.dart';

class Archiveconterler extends GetxController {
  Archivedata archivedata = Archivedata(Get.find());
  Ratingorder ratingorder = Ratingorder(Get.find());
  late StatusRequset statusRequset;
  Myserives myserives = Get.find();
  List<Ordermodel> data = [];

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
    var respon = await archivedata
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

  ratingOrder(String orderid,  double rating ,String ratingcomment) async {
    statusRequset = StatusRequset.laoding;
    update();
    var respon = await ratingorder.getdata(
        {"orderid": orderid, "rating": rating.toString(), "ratingcomment": ratingcomment});
    statusRequset = handledata(respon);
    print(
        "////////////////rtrrr//////////////$respon//////////////////////////////////////////");
    if (statusRequset == StatusRequset.success) {
      if (respon["status"] == "success") {
        getdata();
      } else {
        statusRequset = StatusRequset.failure;
      }
    }
    update();
  }

  gotodtetials(ordermodel) {
    Get.toNamed(Approutes.orderdetails, arguments: {"ordermodel": ordermodel});
  }

  @override
  void onInit() {
    getdata();
    super.onInit();
  }
}
