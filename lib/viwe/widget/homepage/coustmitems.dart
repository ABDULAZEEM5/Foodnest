import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodnest/controller/homepage_controller.dart';
import 'package:foodnest/core/constans/appcolors.dart';
import 'package:foodnest/linkurl.dart';

class Customitmes extends StatelessWidget {
  final Homeconteroller controller;
  const Customitmes({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Appcolors.grey.withOpacity(0.10),
      margin: EdgeInsets.only(top: 20),
      height: 250,
      child: GridView.builder(
        itemCount: controller.itemsdata.length,
        scrollDirection: Axis.vertical,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) => Container(
          margin: EdgeInsets.all(6),
          color: Appcolors.white,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        "${Applinkurl.imageitmes}/${controller.itemsdata[index].itemsImage}",
                    height: 130,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("${controller.itemsdata[index].itemsName}"),
                      const SizedBox(
                        width: 15,
                      ),
                      Text("${controller.itemsdata[index].itemsPrice}")
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
