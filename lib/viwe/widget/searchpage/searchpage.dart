import 'package:flutter/material.dart';
import 'package:foodnest/controller/homepage_controller.dart';
import 'package:foodnest/data/model/items/itemsviwe.dart';
import 'package:foodnest/linkurl.dart';
import 'package:get/get.dart';

class SearchDataPage extends GetView<Homeconteroller> {
  final List <Itemsviwe> itemsmodel;
  const SearchDataPage( {super.key,required this.itemsmodel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.only(bottom: 10),
      height: 700,
     margin: const EdgeInsets.only(top: 10),
      child: ListView.builder(
        itemCount: controller.dataserch.length,
        itemBuilder: (context, i) => InkWell( onTap: () {
          controller.gotodetials(controller.dataserch[i]);
        },
          child: Card(
            child: Row(children: [
              Image.network(
                    "${Applinkurl.imageitmes}/${controller.dataserch[i].itemsImage}",height: 50),
                Text("${controller.dataserch[i].itemsName}")],)),
        )
      ),
    );
  }
}
