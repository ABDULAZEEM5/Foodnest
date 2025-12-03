import 'package:flutter/material.dart';
import 'package:foodnest/controller/order/checkout_conterller.dart';
import 'package:foodnest/core/constans/appcolors.dart';
import 'package:foodnest/core/constans/appimages.dart';
import 'package:foodnest/core/functions/handeldatarequset.dart';
import 'package:foodnest/viwe/widget/checkout/addressdelivery.dart';
import 'package:foodnest/viwe/widget/checkout/bouttom.dart';
import 'package:foodnest/viwe/widget/checkout/deliverytype.dart';
import 'package:foodnest/viwe/widget/checkout/paymenttype.dart';
import 'package:foodnest/viwe/widget/checkout/textchooes.dart';
import 'package:get/get.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckoutConterller());
    return Scaffold(
      appBar: AppBar(title: const Text("Checkout")),
      body: GetBuilder<CheckoutConterller>(
        builder: (controller) => HandledataRequset(
                  statusRequset: controller.statusRequset,
                  widget: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Textchooes(
                  text: "choose a payment method",
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                    onTap: () {
                      controller.chooespaymenttype("0");
                    },
                    child: Paymenttype(
                        isactive: controller.paymenttype == "0" ? true : false,
                        text: "Cash")),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                    onTap: () {
                      controller.chooespaymenttype("1");
                    },
                    child: Paymenttype(
                        isactive: controller.paymenttype == "1" ? true : false,
                        text: "Card")),
                const SizedBox(
                  height: 30,
                ),
                const Textchooes(
                  text: "choose delivery type",
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        controller.chooesdelivery("1");
                        
                      },
                      child: Deliverytype(
                        isactive: controller.deliverytype == "1" ? true : false,
                        text: "delivery",
                        image: Appimages.delivery,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      onTap: () {
                        controller.chooesdelivery("0");
                      },
                      child: Deliverytype(
                        isactive: controller.deliverytype == "0" ? true : false,
                        text: "service",
                        image: Appimages.restaurant,
                      ),
                    )
                  ],
                ),
               
                Column(
                    children: [
                        if (controller.deliverytype == "1" )
                      controller.addressid != null ?
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Textchooes(
                                text: "choose your address",
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 180,
                                child: ListView(
                                  children: List.generate(
                                      controller.data.length,
                                      (i) => InkWell(
                                            onTap: () {
                                              controller.chooesaddress(
                                                  controller.data[i].addressId!);
                                            },
                                            child: Addressdeivery(
                                              title:
                                                  "${controller.data[i].addressName}",
                                              subtitle:
                                                  "${controller.data[i].addressCity}",
                                              isactive: controller.addressid ==
                                                      controller
                                                          .data[i].addressId
                                                        
                                                  ? true
                                                  : false,
                                            ),
                                          )),
                                ),
                              ),
                            ],
                          ),
                        ):GestureDetector(
                          onTap: () {
                            controller.gotoaddress();
                          },
                          child: Container( margin: EdgeInsets.only(top: 20),
                            child: Center(child: Text("add address pleas", style: TextStyle(fontSize: 19,
                                            fontWeight: FontWeight.bold,
                                                color:Appcolors.primarycolor)),)),
                        ),
                          const SizedBox(
                  height: 45,
                ),
                Center(
                    child: BouttomOrder(
                  onPressed: () {
                    controller.checkoutdata();
                  },
                  text: 'CheckOut',
                ))
                    ],
                  ),
                
              ],
            )),
      ),)
    );
  }
}
