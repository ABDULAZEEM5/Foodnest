import 'package:flutter/material.dart';
import 'package:foodnest/controller/cart/viwe_conterller.dart';
import 'package:foodnest/core/constans/appcolors.dart';
import 'package:foodnest/viwe/widget/cart/rowprice.dart';
import 'package:foodnest/viwe/widget/cart/textformfiladcobon.dart';
import 'package:get/get.dart';

class Novigationbuttombar extends GetView<Viwecartconterller> {
  final void Function() onTapcoupon;
  final void Function() onPressed;
  final TextEditingController couponconterller;
  final String textcheck;
  final String textorder;
  final String textsumpric;
  final String price;
  final String textshopping;
  final String priceshopping;
  final String texttotalprice;
  final String tatolprice;
  final String textdiscount;
  final String pricediscount;
  const Novigationbuttombar(
      {super.key,
      required this.onTapcoupon,
      required this.onPressed,
      required this.textcheck,
      required this.textorder,
      required this.textsumpric,
      required this.price,
      required this.textdiscount,
      required this.pricediscount,
      required this.textshopping,
      required this.priceshopping,
      required this.texttotalprice,
      required this.tatolprice,
      required this.couponconterller});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Appcolors.white,
        height: 310,
        child: Stack(
          children: [
            Positioned(
              right: 28,
              top: 10,
              child: controller.couponname == null
                  ? Row(
                      children: [
                        SizedBox(
                            width: 200,
                            height: 40,
                            child: TextfildeCustomecoupon(
                              mycontroller: couponconterller,
                            )),
                        const SizedBox(
                          width: 16,
                        ),
                        InkWell(
                          onTap: onTapcoupon,
                          child: Container(
                              alignment: Alignment.center,
                              height: 40,
                              width: 90,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  color: Appcolors.scondecolor,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Text(
                                textcheck,
                                style: TextStyle(color: Appcolors.white),
                              )),
                        )
                      ],
                    )
                  : Container(
                      margin: EdgeInsets.only(right: 130),
                      child: Text("${controller.couponname}",
                          style: TextStyle(fontSize: 26,
                          fontWeight: FontWeight.bold,
                            color: Appcolors.scondecolor)),
                    ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 70),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Appcolors.primarycolor,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Rowprices(
                    text: textsumpric,
                    textprice: price,
                  ),
                  Rowprices(
                    text: textdiscount,
                    textprice: pricediscount,
                  ),
                  Rowprices(
                    text: textshopping,
                    textprice: priceshopping,
                  ),
                  const Divider(),
                  Rowprices(
                    text: texttotalprice,
                    textprice: tatolprice,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 4,
              right: 40,
              child: SizedBox(
                  width: 300,
                  height: 43,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Appcolors.scondecolor),
                      onPressed: onPressed,
                      child: Text(
                        textorder,
                        style: TextStyle(
                            color: Appcolors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ))),
            )
          ],
        ));
  }
}
