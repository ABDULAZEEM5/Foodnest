import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodnest/controller/setting.dart';
import 'package:foodnest/core/constans/appcolors.dart';
import 'package:foodnest/core/constans/appimages.dart';
import 'package:foodnest/core/constans/approutes.dart';
import 'package:foodnest/viwe/widget/setting/settinglisttitel.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    Settingcontroller controller = Get.put(Settingcontroller());
    return Scaffold(
      appBar: AppBar(
          title: Container(
              alignment: Alignment.center, child: const Text("Settings"))),
      body: Container(
          height: 800,
          margin: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Appcolors.grey, width: 2),
                              borderRadius: BorderRadius.circular(60)),
                          margin: const EdgeInsets.only(top: 20, right: 30),
                          child: CircleAvatar(
                          
                            backgroundImage: AssetImage(Appimages.profile),
                            // child: Image.asset(Appimages.profile),
                            radius: 60,
                            // child: const Icon(
                            //   Icons.person_sharp,
                            //   size: 110,
                            //   color: Colors.black,
                            // ),
                          )),
                      Positioned(
                          bottom: -20,
                          right: 68,
                          child: Container(
                              clipBehavior: Clip.hardEdge,
                              margin: EdgeInsets.only(top: 115, left: 38),
                              decoration: BoxDecoration(
                                  color: Appcolors.white,
                                  borderRadius: BorderRadius.circular(30)),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.camera_alt_outlined)))),
                    ],
                  ),
                  Text(
                    "Hi!   ${controller.username}",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Divider(),
              Listtitlecoustem(
                text: "Profile",
                icon: Icons.person,
                onTap: () {},
              ),
              Listtitlecoustem(
                text: "Notification",
                icon: Icons.notifications,
                onTap: () {
                  Get.toNamed(Approutes.notification);
                },
              ),
              Listtitlecoustem(
                text: "Address",
                icon: Icons.home,
                onTap: () {
                  Get.toNamed(Approutes.viweaddress);
                },
              ),
              Listtitlecoustem(
                text: "Orders",
                icon: Icons.card_travel_outlined,
                onTap: () {
                  Get.toNamed(Approutes.peding);
                },
              ),
              Listtitlecoustem(
                text: "Orders History",
                icon: Icons.archive,
                onTap: () {
                  Get.toNamed(Approutes.archive);
                },
              ),
              Listtitlecoustem(
                text: "Contact Us",
                icon: Icons.call,
                onTap: () {
                  launchUrl(Uri.parse("tel:+9647838227243"));
                },
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              Listtitlecoustem(
                text: "Log out",
                icon: Icons.exit_to_app_rounded,
                onTap: () {
                  controller.signout();
                },
              ),
            ],
          )),
    );
  }
}
