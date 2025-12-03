import 'package:flutter/material.dart';
import 'package:foodnest/controller/notify_conterller.dart';
import 'package:foodnest/core/constans/appcolors.dart';
import 'package:foodnest/core/functions/handeldatarequset.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class Notification extends StatelessWidget {
  const Notification({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Notifictionconterller());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Notification"),
        ),
        body: GetBuilder<Notifictionconterller>(
            builder: (contller) => HandledataRequset(
                statusRequset: contller.statusRequset,
                widget: ListView.builder(
                  itemCount: contller.data.length,
                  itemBuilder: (context, i) => Container(
                    height: 100,
                    child: Card(
                      color: Appcolors.scondecolor.withOpacity(0.1),
                      child: ListTile(
                        title: Text("${contller.data[i].notifyTitle}"),
                        subtitle: Text("${contller.data[i].notifyBody}"),
                        trailing: Text(
                            Jiffy.parse("${contller.data[i].notifyTime}")
                                .fromNow()),
                      ),
                    ),
                  ),
                ))));
  }
}
