import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodnest/core/constans/appcolors.dart';

class Itemcart extends StatelessWidget {
  final String image;
  final String body;
  final String subbody;
  final String count;
  final void Function() onPressedadd;
  final void Function() onPresseddelete;
  const Itemcart(
      {super.key,
      required this.image,
      required this.body,
      required this.subbody,
      required this.count,
      required this.onPressedadd,
      required this.onPresseddelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Card(
        color: Appcolors.white,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Appcolors.grey.withOpacity(0.20)),
                  // padding: EdgeInsets.all(10),
                  height: 150,
                  child: CachedNetworkImage(imageUrl: image,)
                  ),
            ),
            Expanded(
                flex: 2,
                child: Container(
                    margin: const EdgeInsets.only(left: 10, top: 45),
                    child: Column(
                      children: [
                        Text(body,style: Theme.of(context).textTheme.bodyLarge),
                        Text(subbody,style: Theme.of(context).textTheme.headlineSmall,),
                      ],
                    ))),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: Appcolors.primarycolor.withOpacity(0.50),
                    borderRadius: BorderRadius.circular(20)),
                margin: const EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    IconButton(
                        onPressed: onPressedadd,
                        icon: const Icon(Icons.add),
                        iconSize: 30),
                    Text(
                      count,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    IconButton(
                        padding: const EdgeInsets.only(bottom: 7),
                        onPressed: onPresseddelete,
                        icon: const Icon(Icons.minimize),
                        iconSize: 30)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
