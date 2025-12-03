import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodnest/core/constans/appcolors.dart';

class Itemsimage extends StatelessWidget {
  final String image;
  const Itemsimage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
            color: Appcolors.scondecolor),
        height: 270,
        width: double.infinity,
        child: Hero(
          tag: "1",
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            height: 90,
            imageUrl: image,
          ),
        ));
  }
}
