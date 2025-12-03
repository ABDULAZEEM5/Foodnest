import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodnest/controller/favorites/add.dart';
import 'package:foodnest/controller/items/items.dart';
import 'package:foodnest/core/constans/appcolors.dart';
import 'package:foodnest/core/constans/approutes.dart';
import 'package:foodnest/core/functions/handeldatarequset.dart';
import 'package:foodnest/linkurl.dart';
import 'package:foodnest/viwe/widget/homepage/textformfild.dart';
import 'package:foodnest/viwe/widget/item/categrioseitems.dart';
import 'package:foodnest/viwe/widget/searchpage/searchpage.dart';
import 'package:get/get.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Itemscontroller());
    Get.put(AddDeletefaveconterller());
    return Scaffold(
      body: GetBuilder<Itemscontroller>(
        builder: (controller) => ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
           TextformfildeCustome(
                      onsearch: ()  {
                        controller.getsearch();
                      },
                      onChanged: (val) {
                        controller.checksearch(val);
                      },
                      mycontroller: controller.search!,
                    ),
            HandledataRequset(
              statusRequset: controller.statusRequset,
              widget: controller.isSearch == true
                  ?  SearchDataPage(itemsmodel: controller.dataserch,)
                  : Container(
                      margin: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Categrioseitems(
                            controller: controller,
                          ),
                          Container(
                            clipBehavior: Clip.none,
                            padding: const EdgeInsets.only(bottom: 20),
                            margin: const EdgeInsets.only(bottom: 10),
                            height: 700,
                            child: GridView.builder(
                                itemCount: controller.data.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: .7,
                                        crossAxisCount: 2),
                                itemBuilder: (context, i) {
                                  controller.setFavorites(
                                      controller.data[i].itemsId!,
                                      controller.data[i].favorites!);

                                  return InkWell(
                                    onTap: () {
                                      Get.toNamed(Approutes.itemsdetails,
                                          arguments: {
                                            "itemsdata": controller.data[i]
                                          });
                                    },
                                    child: Card(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Hero(
                                              tag: "1",
                                              child: CachedNetworkImage(
                                                fit: BoxFit.cover,
                                                imageUrl:
                                                    "${Applinkurl.imageitmes}/${controller.data[i].itemsImage}",
                                                height: double.infinity,
                                                width: double.infinity,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(top: 10),
                                            alignment: Alignment.center,
                                            child: Text(
                                              "${controller.data[i].itemsName}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineMedium,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "${controller.data[i].itemsPrice}\$",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineSmall,
                                                ),
                                                GetBuilder<
                                                    AddDeletefaveconterller>(
                                                  builder:
                                                      (favoriteconterller) =>
                                                          IconButton(
                                                              onPressed: () {
                                                                if (controller
                                                                            .isFavorites[
                                                                        controller
                                                                            .data[i]
                                                                            .itemsId] ==
                                                                    1) {
                                                                  favoriteconterller.deletedata(
                                                                      controller
                                                                          .data[
                                                                              i]
                                                                          .itemsId!
                                                                          .toString());
                                                                  controller.setFavorites(
                                                                      controller
                                                                          .data[
                                                                              i]
                                                                          .itemsId!,
                                                                      0);
                                                                } else {
                                                                  favoriteconterller.adddata(
                                                                      controller
                                                                          .data[
                                                                              i]
                                                                          .itemsId
                                                                          .toString());
                                                                  controller.setFavorites(
                                                                      controller
                                                                          .data[
                                                                              i]
                                                                          .itemsId!,
                                                                      1);
                                                                }
                                                              },
                                                              icon: Icon(
                                                                Icons.favorite,
                                                                size: 30,
                                                                color: controller.isFavorites[controller
                                                                            .data[
                                                                                i]
                                                                            .itemsId] ==
                                                                        1
                                                                    ? Appcolors
                                                                        .primarycolor
                                                                    : Appcolors
                                                                        .grey
                                                                        .withOpacity(
                                                                            0.90),
                                                              )),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          )
                        ],
                      )),
            )
          ],
        ),
      ),
    );
  }
}
