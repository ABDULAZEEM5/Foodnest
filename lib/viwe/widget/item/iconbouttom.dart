// import 'package:flutter/material.dart';
// import 'package:foodnest/controller/favorites/add.dart';
// import 'package:foodnest/controller/items/items.dart';
// import 'package:foodnest/core/constans/appcolors.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';

// class Iconbouttom extends StatelessWidget {
//    final Itemscontroller controller;
//   const Iconbouttom({super.key, required this.controller});

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<AddDeletefaveconterller>(
//       builder: (favoriteconterller) => IconButton(
//           onPressed: () {
//             if (controller.isFavorites[controller.data[i].itemsId] == 1) {
//               favoriteconterller
//                   .deletedata(controller.data[i].itemsId!.toString());
//               controller.setFavorites(controller.data[i].itemsId!, 0);
//             } else {
//               favoriteconterller.adddata(controller.data[i].itemsId.toString());
//               controller.setFavorites(controller.data[i].itemsId!, 1);
//             }
//           },
//           icon: Icon(
//             Icons.favorite,
//             size: 30,
//             color: controller.isFavorites[controller.data[i].itemsId] == 1
//                 ? Appcolors.primarycolor
//                 : Appcolors.grey.withOpacity(0.90),
//           )),
//     );
//   }
// }
