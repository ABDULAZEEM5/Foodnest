import 'package:flutter/material.dart';
import 'package:foodnest/controller/order/archive_conterller.dart';
import 'package:foodnest/core/constans/appcolors.dart';
import 'package:foodnest/core/functions/handeldatarequset.dart';
import 'package:foodnest/viwe/screen/orders/rating.dart';
import 'package:foodnest/viwe/widget/order/body.dart';
import 'package:foodnest/viwe/widget/order/titele.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class Archiveorder extends StatelessWidget {
  const Archiveorder({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Archiveconterler());
    return Scaffold(
      appBar: AppBar(title: const Text("Archive")),
      body: GetBuilder<Archiveconterler>(
        builder: (controller) => HandledataRequset(
          statusRequset: controller.statusRequset,
          widget: Container(
              margin: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, i) => Card(
                  child: Column(
                    children: [
                      TiteleOrder(
                          text1: "OrderNumber : ",
                          text2: "${controller.data[i].orderId}"),
                      const Divider(),
                      Orderbody(
                        text1: "orderStatus : ",
                        text2:
                            "${controller.orderstatus("${controller.data[i].orderStatus}")}",
                      ),
                      Orderbody(
                        text1: " orderPrice : ",
                        text2: "${controller.data[i].orderPrice}",
                      ),
                      Orderbody(
                        text1: "deliveryPrice : ",
                        text2:
                            "${controller.delverytype("${controller.data[i].orderType}")}",
                      ),
                      Orderbody(
                        text1: "deliveryPrice : ",
                        text2: "${controller.data[i].orderPricedelivery}",
                      ),
                      Orderbody(
                        text1: "paymentmethood : ",
                        text2:
                            "${controller.payementmethood("${controller.data[i].orderType}")}",
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Orderbody(
                              text1: "Timeorder : ",
                              text2:
                                  Jiffy.parse("${controller.data[i].orderTime}")
                                      .fromNow()),
                          GestureDetector(
                            child: Container(
                              height: 60,
                              width: 100,
                              padding: const EdgeInsets.all(10),
                              child: Card(
                                  color: Appcolors.primarycolor,
                                  child: const Text(
                                    textAlign: TextAlign.center,
                                    "detials",
                                    style: TextStyle(
                                      fontSize: 19,
                                    ),
                                  )),
                            ),
                            onTap: () {
                              controller.gotodtetials(controller.data[i]);
                            },
                          ),
                          if (controller.data[i].rating == 0)
                            IconButton(
                                onPressed: () {
                                  ShowratingDilog(context,
                                      controller.data[i].orderId.toString());
                                },
                                icon: Icon(
                                  Icons.star_purple500_sharp,
                                  color: Appcolors.primarycolor,
                                  size: 40,
                                ))
                        ],
                      ),
                      const Divider(),
                      TiteleOrder(
                          text1: "TotalPrice : ",
                          text2: "${controller.data[i].orderTotalprcie}"),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
