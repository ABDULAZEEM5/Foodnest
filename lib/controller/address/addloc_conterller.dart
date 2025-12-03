import 'dart:async';

import 'package:foodnest/core/classes/statusRequset.dart';
import 'package:foodnest/core/constans/approutes.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddlocConterller extends GetxController {
  StatusRequset statusRequset = StatusRequset.laoding;
  Position? position;
  CameraPosition? kGooglePlex;
  Completer<GoogleMapController>? controllercomp;
  List<Marker> marker = [];

  String? lat;
  String? long;

  getmarker(LatLng latLng) {
    marker.clear();
    marker.add(Marker(markerId:const MarkerId("1"), position: latLng));
    lat = latLng.latitude.toString();
    long = latLng.longitude.toString();
    update();
  }

  getcurrenlocion() async {
    position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 14.4746,
    );
    getmarker(LatLng(position!.latitude, position!.longitude));
    statusRequset = StatusRequset.none;
    update();
  }

  gotoaddressDitails() {
    Get.toNamed(Approutes.adddetialsaddress,
        arguments: {"lat": lat, "long": long});
  }

  @override
  void onInit() {
    controllercomp = Completer<GoogleMapController>();
    getcurrenlocion();
    super.onInit();
  }
}
