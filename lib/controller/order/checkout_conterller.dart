import 'package:foodnest/core/classes/statusRequset.dart';
import 'package:foodnest/core/constans/approutes.dart';
import 'package:foodnest/core/functions/Handledata.dart';
import 'package:foodnest/core/servies/servies.dart';
import 'package:foodnest/data/dataremout/address/viwe.dart';
import 'package:foodnest/data/dataremout/order/ckeckout.dart';
import 'package:foodnest/data/model/address.dart';
import 'package:get/get.dart';

class CheckoutConterller extends GetxController {
  Viwedeleadderssdata adderssdata = Viwedeleadderssdata(Get.find());
  Checkout checkout = Checkout(Get.find());
  StatusRequset statusRequset = StatusRequset.none;
  Myserives myserives = Get.find();
  List<Addressmodel> data = [];

  String? paymenttype;
  String? deliverytype;
  int? addressid;

  late int couponid;
  late int price;
  late int coupondiscout;

  chooespaymenttype(String val) {
    paymenttype = val;
    update();
  }

  chooesdelivery(String val) {
    deliverytype = val;
    update();
  }

  chooesaddress(int val) {
    addressid = val;
    update();
  }

  checkoutdata() async {
    if (paymenttype == null)
      return Get.snackbar("wroning", "pleas choose paymentMethod");
    if (deliverytype == null)
      return Get.snackbar("wroning", "pleas choose deliverytype");
    if (deliverytype == "1" && addressid == null)
      return Get.snackbar("wroning", "pleas add the address");
    statusRequset = StatusRequset.laoding;
    Map datacheck = {
      "orderuser": myserives.sharedPre.getString("id"),
      "ordertype": deliverytype.toString(),
      "paymentmethod": paymenttype,
      "ordercoupon": couponid.toString(),
      "coupondiscount": coupondiscout.toString(),
      "orderprice": price.toString(),
      "pricedelivery": "10",
      "orderaddress": addressid.toString()
    };

    var respons = await checkout.getdata(datacheck);
    print(
        "/////////////////////kimoErorr/$respons//////////////////////////////");
    statusRequset = handledata(respons);

    if (statusRequset == StatusRequset.success) {
      if (respons["status"] == "success") {
        Get.snackbar("success", "the order was successful");
        Get.offAllNamed(Approutes.homepag);
      } else {
        statusRequset = StatusRequset.failure;
        Get.snackbar("Erorr", "somthink wrong plase try again");
      }
    }
    update();
  }

  getaddress() async {
    statusRequset = StatusRequset.laoding;
    var respons = await adderssdata
        .getdata({"addressuserid": myserives.sharedPre.getString("id")});
    statusRequset = handledata(respons);
    if (statusRequset == StatusRequset.success) {
      print("////////////////////////");
      if (respons["status"] == "success") {
        List dataaddress = respons["data"];
        data.addAll(dataaddress.map((e) => Addressmodel.fromJson(e)));
        addressid = data[0].addressId!;
      } else {
        statusRequset = StatusRequset.none;
      }
    }
    update();
  }

  void gotoaddress() {
    Get.toNamed(Approutes.addaddress);
  }

  @override
  void onInit() {
    getaddress();
    price = Get.arguments["price"];
    coupondiscout = Get.arguments["coupondiscout"];
    couponid = Get.arguments["couponid"];
    super.onInit();
  }
}
