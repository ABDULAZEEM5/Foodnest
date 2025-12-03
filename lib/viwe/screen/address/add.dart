import 'package:flutter/material.dart';
import 'package:foodnest/controller/address/addloc_conterller.dart';
import 'package:foodnest/core/constans/appcolors.dart';
import 'package:foodnest/core/functions/handeldatarequset.dart';
import 'package:foodnest/viwe/widget/address/butoomaddress.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Addaddress extends StatelessWidget {
  const Addaddress({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddlocConterller());
    return Scaffold(
        appBar: AppBar(
           backgroundColor: Appcolors.scondecolor,
          centerTitle: true,
          title: const Text("Add address"),
        ),
        body: GetBuilder<AddlocConterller>(
          builder: (controllerp) => HandledataRequset(
            statusRequset: controllerp.statusRequset,
            widget: Stack(children: [
               Column(
                children: [
                  controllerp.kGooglePlex != null?
                    Flexible(
                        child: GoogleMap(
                          
                          onTap: (latLng) {
                            controllerp.getmarker(latLng);
                          },
                          markers: controllerp.marker.toSet(),
                          mapType: MapType.normal,
                          initialCameraPosition: controllerp.kGooglePlex!,
                          onMapCreated: (GoogleMapController controller) {
                            controllerp.controllercomp!.complete(controller);
                          },
                        ),
                      )
                    :Text("noo")
                ],
              ), Positioned(
                bottom: 20,
                right: 65,
                child: Bouttomaddress(onPressed: (){
                  controllerp.gotoaddressDitails();
                },text: 'Complete',))

  ]),
          ),
        ));
  }
}
