import 'package:flutter/material.dart';
import 'package:foodnest/controller/address/add.dart';
import 'package:foodnest/core/constans/appcolors.dart';
import 'package:foodnest/core/functions/handeldatarequset.dart';
import 'package:foodnest/core/functions/validate.dart';
import 'package:foodnest/viwe/widget/address/butoomaddress.dart';
import 'package:foodnest/viwe/widget/address/textformfiled.dart';
import 'package:get/get.dart';

class Adddetialsddress extends StatelessWidget {
  const Adddetialsddress({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(Adddetailsaddressconterll());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolors.scondecolor,
        centerTitle: true,
        title: const Text("Add details"),
      ),
      body: GetBuilder<Adddetailsaddressconterll>(builder: (controller) => 
         HandledataRequset(statusRequset: controller.statusRequset, widget: Container(
          margin: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Form(
                key: controller.formState,
                child: Column(
                  children: [
                    TextformfiledAddress(
                      validator: (val) {
                        return getvalidate(val!, 5, 30, "name");
                      },
                      mycontroller: controller.name,
                      hinttext: 'name',
                    ),
                    TextformfiledAddress(
                      validator: (val) {
                        return getvalidate(val!, 5, 30, "street");
                      },
                      mycontroller: controller.street,
                      hinttext: 'street',
                    ),
                    TextformfiledAddress(
                      validator: (val) {
                        return getvalidate(val!, 5, 30, "city");
                      },
                      mycontroller: controller.city,
                      hinttext: 'city',
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Bouttomaddress(
                      onPressed: () {
                        controller.adddata();
                      },
                      text: 'Add',
                    )
                  ],
                ),
              ),
            ],
          ),
        ),)
      ),
    );
  }
}
