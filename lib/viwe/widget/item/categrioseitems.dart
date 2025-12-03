import 'package:flutter/material.dart';
import 'package:foodnest/controller/items/items.dart';
import 'package:foodnest/core/constans/appcolors.dart';

class Categrioseitems extends StatelessWidget {
  final Itemscontroller controller;
  const Categrioseitems({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
      ),
      height: 30,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) => InkWell(
                onTap: () {
                  controller.chengeselect(
                      i, controller.categroisdata[i].categoriesId!);
                },
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: controller.selected == i
                              ? Border(
                                  bottom: BorderSide(
                                  width: 3,
                                  color: Appcolors.scondecolor,
                                ))
                              : const Border()),
                      margin: const EdgeInsets.only(right: 25, left: 10),
                      child: Text(
                        "${controller.categroisdata[i].categoriesName}",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                  ],
                ),
              ),
          itemCount: controller.categroisdata.length),
    );
  }
}
