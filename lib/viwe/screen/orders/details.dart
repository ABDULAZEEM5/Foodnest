import 'package:flutter/material.dart';
import 'package:foodnest/controller/order/details_conterller.dart';
import 'package:foodnest/core/constans/appcolors.dart';
import 'package:foodnest/core/functions/handeldatarequset.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Orderdetails extends StatelessWidget {
  const Orderdetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DetailsConterller());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Details"),
      ),
      body: GetBuilder<DetailsConterller>(
          builder: (controllerp) => HandledataRequset(
                statusRequset: controllerp.statusRequset,
                widget: ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 10),
                      child: Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Table(children: [
                              TableRow(children: [
                                Text(
                                  textAlign: TextAlign.center,
                                  "Item",
                                  style: TextStyle(
                                      fontSize: 19,
                                      color: Appcolors.scondecolor,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  textAlign: TextAlign.center,
                                  "Quantity",
                                  style: TextStyle(
                                      fontSize: 19,
                                      color: Appcolors.scondecolor,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  textAlign: TextAlign.center,
                                  "Price",
                                  style: TextStyle(
                                      fontSize: 19,
                                      color: Appcolors.scondecolor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ]),
                              ...List.generate(
                                controllerp.data.length,
                                (i) => TableRow(children: [
                                  Text(
                                    "${controllerp.data[i].itemsName}",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${controllerp.data[i].scountitems}",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "${controllerp.data[i].spriceitems}",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  )
                                ]),
                              ),
                            ]),
                            Container(
                              margin: const EdgeInsets.only(top: 10, bottom: 5),
                              child: Text(
                                "TotalPrice : ${controllerp.ordermodel.orderTotalprcie}\$",
                                style: TextStyle(
                                    fontSize: 19,
                                    color: Appcolors.scondecolor,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                     if (controllerp.ordermodel.orderType.toString() == "1")
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            Card(
                              child: ListTile(
                                  title: Text(
                                      "${controllerp.ordermodel.addressCity}"),
                                  subtitle: Text(
                                      "${controllerp.ordermodel.addressStreet}")),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 350,
                              child: GoogleMap(
                                markers: controllerp.marker.toSet(),
                                mapType: MapType.normal,
                                initialCameraPosition: controllerp.kGooglePlex!,
                                onMapCreated: (GoogleMapController controller) {
                                  controllerp.controllercomp!
                                      .complete(controller);
                                },
                              ),
                            )
                          ],
                        ),
                      )
                  ],
                ),
              )),
    );
  }
}
