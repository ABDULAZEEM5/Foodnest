import 'package:flutter/material.dart';
import 'package:foodnest/controller/cart/adddetete_conteller.dart';
import 'package:foodnest/controller/items/itemsdetails.dart';
import 'package:foodnest/core/functions/handeldatarequset.dart';
import 'package:foodnest/linkurl.dart';
import 'package:foodnest/viwe/widget/auth/costumboutton.dart';
import 'package:foodnest/viwe/widget/itemsdetials/body_name.dart';
import 'package:foodnest/viwe/widget/itemsdetials/discripiton.dart';
import 'package:foodnest/viwe/widget/itemsdetials/itemimage.dart';
import 'package:foodnest/viwe/widget/itemsdetials/itemsprice_add.dart';
import 'package:foodnest/viwe/widget/itemsdetials/sizeitems.dart';
import 'package:get/get.dart';

class Itemsdetails extends StatelessWidget {
  const Itemsdetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Itemsdetailscontrller());
    Get.put(AddDeleteconterller());
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.all(10),
      child: ListView(
        children: [
          Container(
              margin: const EdgeInsets.only(bottom: 15),
              alignment: Alignment.center,
              child: Text(
                "Item Details",
                style: Theme.of(context).textTheme.bodyLarge,
              )),
          GetBuilder<Itemsdetailscontrller>(
              builder: (controller) => HandledataRequset(
                statusRequset: controller.statusRequset,
                widget:  Column(
                      children: [
                        Itemsimage(
                            image:
                                "${Applinkurl.imageitmes}/${controller.itemsdata.itemsImage}"),
                        const SizedBox(height: 20),
                        Bodyname(text: "${controller.itemsdata.itemsName}"),
                        Discripitonbody(
                            text:
                                """${controller.itemsdata.itemsDescription}${controller.itemsdata.itemsDescription}${controller.itemsdata.itemsDescription}${controller.itemsdata.itemsDescription} """),
                        const SizedBox(
                          height: 30,
                        ),
                        const Sizeitme(),
                        const SizedBox(
                          height: 70,
                        ),
                        ItemspriceAdd(
                          add: () {
                           controller.add();
                          },
                          delete: () {
                            controller.delete();
                          },
                          text: "\$${controller.itemsdata.itemsPrice}",
                          textcard: "${controller.itemcount}",
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        CoustomloginButton(
                          text: 'Add to Card',
                          onPressed: () {
                            controller.gotocart();
                          },
                        )
                      ],
                    ),
              )),
        ],
      ),
    ));
  }
}
