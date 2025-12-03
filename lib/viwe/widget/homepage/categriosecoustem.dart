import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodnest/controller/homepage_controller.dart';
import 'package:foodnest/core/constans/appcolors.dart';
import 'package:foodnest/linkurl.dart';

class Coustmcategrios extends StatelessWidget {
  final Homeconteroller homeconteroller;
  const Coustmcategrios({super.key, required this.homeconteroller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      height: 90,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 15),
        itemBuilder: (context, i) => InkWell(
          onTap: () {
            homeconteroller.gotoitemspage(
                i, homeconteroller.categroisdata[i].categoriesId!);
          },
          child: Container(
              padding: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                  color: Appcolors.grey.withOpacity(0.10),
                  borderRadius: BorderRadius.circular(20)),
              width: 70,
              child: Column(
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        "${Applinkurl.imagecategories}/${homeconteroller.categroisdata[i].categoriesImage}",
                    height: 48,
                  ),
                  
                  Text(
                    "${homeconteroller.categroisdata[i].categoriesName}",
                    textAlign: TextAlign.center,
                    style: TextStyle(),
                  ),
                ],
              )),
        ),
        itemCount: homeconteroller.categroisdata.length,
      ),
    );
  }
}
