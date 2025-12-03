import 'package:flutter/material.dart';
import 'package:foodnest/controller/auth/resetpass_conterrler.dart';
import 'package:foodnest/core/constans/appcolors.dart';
import 'package:foodnest/core/constans/appimages.dart';
import 'package:foodnest/core/functions/handeldatarequset.dart';
import 'package:foodnest/core/functions/validate.dart';
import 'package:foodnest/viwe/widget/auth/costumboutton.dart';
import 'package:foodnest/viwe/widget/auth/coustomtitle.dart';
import 'package:foodnest/viwe/widget/auth/logintextformfiled.dart';
import 'package:foodnest/viwe/widget/auth/logoimag.dart';
import 'package:get/get.dart';

class Resetpassword extends StatelessWidget {
  const Resetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Resetpassconteroller());
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
          child: GetBuilder<Resetpassconteroller>(
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
                                child: Text("Reset password",
                                    style:
                                        Theme.of(context).textTheme.titleLarge),
                              ),
                              Coustemlogintextformfiled(
                                  mycontoller: controller.newpassword,
                                  isnumber: false,
                                  validate: (val) {
                                    return getvalidate(val!, 5, 15, "password");
                                  },
                                  obscureText: controller.t,
                                  hintText: "enter your password",
                                  icon: controller.t == true
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  lable: "password",
                                  onTap: () {
                                    controller.changeviwepass();
                                  }),
                              Coustemlogintextformfiled(
                                  mycontoller: controller.renewpassword,
                                  isnumber: false,
                                  validate: (val) {
                                    return getvalidate(val!, 5, 15, "password");
                                  },
                                  obscureText: controller.t,
                                  hintText: "enter your password",
                                  icon: controller.t == true
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  lable: "password",
                                  onTap: () {
                                    controller.changeviwepass();
                                  }),
                              const SizedBox(height: 40),
                              CoustomloginButton(
                                  text: 'Save',
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
