import 'package:flutter/material.dart';
import 'package:foodnest/controller/auth/signup_conterller.dart';
import 'package:foodnest/core/constans/appcolors.dart';
import 'package:foodnest/core/constans/appimages.dart';
import 'package:foodnest/core/functions/exitapp.dart';
import 'package:foodnest/core/functions/handeldatarequset.dart';
import 'package:foodnest/core/functions/validate.dart';
import 'package:foodnest/viwe/widget/auth/costumboutton.dart';
import 'package:foodnest/viwe/widget/auth/coustomtext.dart';
import 'package:foodnest/viwe/widget/auth/coustomtitle.dart';
import 'package:foodnest/viwe/widget/auth/logintextformfiled.dart';
import 'package:foodnest/viwe/widget/auth/logoimag.dart';
import 'package:get/get.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Signupconteroller());
    return Scaffold(
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          exitapp();
        },
        child: Container(
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
            child: GetBuilder<Signupconteroller>(
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
                                  child: Text("Register",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge),
                                ),
                                Coustmtitle(
                                  child: Text("please Register to login",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall),
                                ),
                                Coustemlogintextformfiled(
                                    mycontoller: controller.username,
                                    isnumber: false,
                                    validate: (val) {
                                      return getvalidate(
                                          val!, 5, 15, "username");
                                    },
                                    hintText: "enter your username",
                                    icon: Icons.person,
                                    lable: "username",
                                    onTap: () {}),
                                Coustemlogintextformfiled(
                                    mycontoller: controller.phone,
                                    isnumber: true,
                                    validate: (val) {
                                      return getvalidate(val!, 5, 15, "phone");
                                    },
                                    hintText: "enter your phone",
                                    icon: Icons.phone_android_rounded,
                                    lable: "phone",
                                    onTap: () {}),
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
                                Coustemlogintextformfiled(
                                    mycontoller: controller.password,
                                    isnumber: false,
                                    validate: (val) {
                                      return getvalidate(
                                          val!, 5, 10, "password");
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
                                    text: 'Sign up',
                                    onPressed: () {
                                      controller.getdata();
                                    }),
                                Coustmtext(
                                    textboutton: "Sign in",
                                    text: "alrady have account ?  ",
                                    onTap: () {
                                      controller.gettologin();
                                    }),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ))),
      ),
    );
  }
}
