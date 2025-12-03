import 'package:flutter/material.dart';
import 'package:foodnest/controller/auth/verfiyemail_conterller.dart';
import 'package:foodnest/core/constans/appcolors.dart';
import 'package:foodnest/core/constans/appimages.dart';
import 'package:foodnest/core/functions/handeldatarequset.dart';
import 'package:foodnest/core/functions/validate.dart';
import 'package:foodnest/viwe/widget/auth/costumboutton.dart';
import 'package:foodnest/viwe/widget/auth/coustomtitle.dart';
import 'package:foodnest/viwe/widget/auth/logintextformfiled.dart';
import 'package:foodnest/viwe/widget/auth/logoimag.dart';
import 'package:get/get.dart';

class Verfierdemail extends StatelessWidget {
  const Verfierdemail({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Verfiyconteroller());
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  tileMode: TileMode.clamp,
                  colors: [
                Appcolors.scondecolor,
                Appcolors.white.withOpacity(0.100),
                Appcolors.scondecolor.withOpacity(0.6),
              ])),
          child: GetBuilder<Verfiyconteroller>(
              builder: (controller) => HandledataRequset(
                    statusRequset: controller.statusRequset,
                    widget: ListView(
                      children: [
                        Form(
                          key: controller.formState,
                          child: Column(
                            children: [
                              Logoimage(image: Appimages.logo),
                              Coustmtitle(
                                child: Text("Verify email",
                                    style:
                                        Theme.of(context).textTheme.titleLarge),
                              ),
                              Coustemlogintextformfiled(
                                  mycontoller: controller.email,
                                  isnumber: false,
                                  validate: (val) {
                                    return getvalidate(val!, 5, 30, "email");
                                  },
                                  hintText: "enter your email",
                                  icon: Icons.email_outlined,
                                  lable: "email",
                                  onTap: () {}),
                              const SizedBox(height: 40),
                              CoustomloginButton(
                                  text: 'check',
                                  onPressed: () {
                                    controller.getdata();
                                  }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ))),
    );
  }
}
