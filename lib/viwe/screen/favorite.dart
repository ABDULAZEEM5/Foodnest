import 'package:flutter/material.dart';
import 'package:foodnest/controller/favorites/viwe.dart';
import 'package:foodnest/linkurl.dart';
import 'package:get/get.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
     Get.lazyPut(()=>Viwfaveconterller(),fenix: true);
    return GetBuilder<Viwfaveconterller>(
      builder: (controller) => Scaffold(
          body: Container(
        margin: const EdgeInsets.all(10),
        child: GridView.builder(
            itemCount: controller.data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: .7),
            itemBuilder: (context, i) => Card(
                  child: Column(children: [
                    Image.network(
                        "${Applinkurl.imageitmes}/${controller.data[i].itemsImage}"),
                    Container(
                        margin: const EdgeInsets.only(),
                        child: Text(controller.data[i].itemsName!,
                            style: Theme.of(context).textTheme.headlineMedium)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: Text(
                                "\$${controller.data[i].itemsPrice}",
                                style:
                                    Theme.of(context).textTheme.headlineSmall)),
                        IconButton(
                          onPressed: () async {
                            await controller.removedata(controller
                                .data[i].favoritesId!
                                .toString());
                          },
                          icon: const Icon(Icons.delete_forever,
                              color: Colors.red, size: 30),
                        )
                      ],
                    )
                  ]),
                )),
      )),
    );
  }
}
