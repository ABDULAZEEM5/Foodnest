import 'package:flutter/material.dart';
import 'package:foodnest/controller/address/viwe.dart';
import 'package:foodnest/core/constans/appcolors.dart';
import 'package:foodnest/core/functions/handeldatarequset.dart';
import 'package:get/get.dart';

class Viweaddress extends StatelessWidget {
  const Viweaddress({super.key});

  @override
  Widget build(BuildContext context) {
    Viweaddressconterller c = Get.put(Viweaddressconterller());
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Appcolors.scondecolor,
          centerTitle: true,
          title: const Text("addresses")),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            c.gotoadd();
          },
          child: const Icon(Icons.add)),
      body: GetBuilder<Viweaddressconterller>(
        builder: (controller) => HandledataRequset(
            statusRequset: controller.statusRequset,
            widget: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                child: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context, i) => Card(
                    child: ListTile(
                      title: Text("${controller.data[i].addressCity}"),
                      subtitle: Text("${controller.data[i].addressName}"),
                      trailing: Container(
                        margin:const EdgeInsets.only(left: 15),
                        child: IconButton(
                            onPressed: () {
                              controller.deletedata(controller.data[i].addressId.toString());
                            },
                            icon: const Icon(
                              size: 30,
                              Icons.delete,
                              color: Colors.red,
                            )),
                      ),
                    ),
                  ),
                ))),
      ),
    );
  }
}
