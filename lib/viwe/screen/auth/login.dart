import 'package:flutter/material.dart';
import 'package:foodnest/controller/auth/signin_controller.dart';
import 'package:foodnest/core/constans/appcolors.dart';
import 'package:foodnest/core/constans/appimages.dart';
import 'package:foodnest/core/constans/approutes.dart';
import 'package:foodnest/core/functions/exitapp.dart';
import 'package:foodnest/core/functions/handeldatarequset.dart';
import 'package:foodnest/core/functions/validate.dart';
import 'package:foodnest/viwe/widget/auth/costumboutton.dart';
import 'package:foodnest/viwe/widget/auth/coustomtext.dart';
import 'package:foodnest/viwe/widget/auth/coustomtitle.dart';
import 'package:foodnest/viwe/widget/auth/logintextformfiled.dart';
import 'package:foodnest/viwe/widget/auth/logoimag.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Loginconteroller());
    return Scaffold(
      body: PopScope(
        canPop: false,
        onPopInvoked: (p) {
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
            child: GetBuilder<Loginconteroller>(
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
                                  child: Text("Login",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge),
                                ),
                                Coustmtitle(
                                  child: Text("please sign in to contniue",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall),
                                ),
                                Coustemlogintextformfiled(
                                    isnumber: false,
                                    validate: (val) {
                                      return getvalidate(val!, 5, 30, "email");
                                    },
                                    mycontoller: controller.email,
                                    hintText: "enter your email",
                                    icon: Icons.email_outlined,
                                    lable: "email",
                                    onTap: () {}),
                                Coustemlogintextformfiled(
                                    isnumber: false,
                                    validate: (val) {
                                      return getvalidate(
                                          val!, 5, 15, "password");
                                    },
                                    mycontoller: controller.password,
                                    obscureText: controller.t,
                                    hintText: "enter your password",
                                    icon: controller.t == true
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    lable: "password",
                                    onTap: () {
                                      controller.changeviwepass();
                                    }),
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(Approutes.verfierdemail);
                                  },
                                  child: Coustmtitle(
                                    child: Text("Forget password",
                                        style: TextStyle(
                                            color: Appcolors.scondecolor,
                                            fontSize: 15)),
                                  ),
                                ),
                                const SizedBox(height: 30),
                                CoustomloginButton(
                                    text: 'Sign in',
                                    onPressed: () {
                                      controller.getdata();
                                    }),
                                Coustmtext(
                                  onTap: () {
                                    controller.gotosignup();
                                  },
                                  textboutton: "Sign up",
                                  text: "Don't have an account ?  ",
                                )
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
