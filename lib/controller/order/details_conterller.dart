import 'dart:async';

import 'package:foodnest/core/classes/statusRequset.dart';
import 'package:foodnest/core/functions/Handledata.dart';
import 'package:foodnest/data/dataremout/order/details.dart';
import 'package:foodnest/data/model/cart.dart';
import 'package:foodnest/data/model/order/order.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailsConterller extends GetxController {
  DetailsData detailsData = DetailsData(Get.find());
  late StatusRequset statusRequset;

  List<Cartmodel> data = [];

  List<Marker> marker = [];
  CameraPosition? kGooglePlex;
  Completer<GoogleMapController>? controllercomp;
 late Ordermodel ordermodel;

  getdata() async {
    statusRequset = StatusRequset.laoding;
    var respons =
        await detailsData.getdata({"orderid": ordermodel.orderId.toString()});
    statusRequset = handledata(respons);
    if (statusRequset == StatusRequset.success) {
      if (respons["status"] == "success") {
        List datadetails = respons["data"];
        data.addAll(datadetails.map((e) => Cartmodel.fromJson(e)));
      } else {
        statusRequset = StatusRequset.failure;
      }
    }
    update();
  }

  oninisle() {
    if (ordermodel.orderType.toString()=="1") {
       kGooglePlex = CameraPosition(
      target: LatLng(double.parse(ordermodel.addressLat!),
          double.parse(ordermodel.addressLong!)),
      zoom: 14.4746,
    );
    marker.add(
      Marker(
          markerId:const MarkerId("1"),
          position: LatLng(double.parse(ordermodel.addressLat!),
              double.parse(ordermodel.addressLong!))),
    );
    update();
  }
   
  }

  @override
  void onInit() {   
    ordermodel = Get.arguments["ordermodel"];
    getdata();
     oninisle();
    super.onInit();
  }
}
