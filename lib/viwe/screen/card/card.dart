import 'package:flutter/material.dart';
import 'package:foodnest/controller/cart/viwe_conterller.dart';
import 'package:foodnest/core/functions/handeldatarequset.dart';
import 'package:foodnest/linkurl.dart';
import 'package:foodnest/viwe/widget/cart/appbar.dart';
import 'package:foodnest/viwe/widget/cart/bottomnavigionbar.dart';
import 'package:foodnest/viwe/widget/cart/itemcard.dart';
import 'package:get/get.dart';

class MyCard extends StatelessWidget {
  const MyCard({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Viwecartconterller());
    return Scaffold(
        bottomNavigationBar: GetBuilder<Viwecartconterller>(
            builder: (controller) => HandledataRequset(
                  statusRequset: controller.statusRequset!,
                  widget: Novigationbuttombar(
                    onTapcoupon: () {
                      controller.checkcoupon();
                    },
                    onPressed: () {
                      controller.gotocheckout();
                    },
                    textcheck: 'check',
                    textorder: 'Order',
                    textsumpric: "price",
                    price: "${controller.sumpric}",
                    textshopping: "shopping",
                    priceshopping: '\$1000',
                    texttotalprice: "totalprice",
                    tatolprice: '${controller.gettotalprice}',
                    couponconterller: controller.textcoupon,
                    textdiscount: 'discount',
                    pricediscount: '\$${controller.coupondiscout}',
                  ),
                )),
        body: SafeArea(
          child: GetBuilder<Viwecartconterller>(
            builder: (controller) => HandledataRequset(
              statusRequset: controller.statusRequset!,
              widget: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Appbarcoustam(
                      onPressed: () {
                        Get.back();
                      },
                      text: "My Card"),
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.only(bottom: 50),
                    height: 500,
                    child: ListView.builder(
                        itemCount: controller.data.length,
                        itemBuilder: (context, i) => Itemcart(
                              body: "${controller.data[i].itemsName}",
                              subbody: "${controller.data[i].spriceitems}",
                              count: "${controller.data[i].scountitems}",
                              image:
                                  "${Applinkurl.imageitmes}/${controller.data[i].itemsImage}",
                              onPressedadd: () async {
                                await controller.adddata(
                                    controller.data[i].itemsId.toString());
                                controller.refreshdata();
                              },
                              onPresseddelete: () async {
                                await controller.deletedata(
                                    controller.data[i].itemsId.toString());
                                controller.refreshdata();
                              },
                            )),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
