import 'package:flutter/widgets.dart';
import 'package:foodnest/core/classes/statusRequset.dart';
import 'package:foodnest/core/constans/appimages.dart';
import 'package:lottie/lottie.dart';

class HandledataRequset extends StatelessWidget {
  final StatusRequset statusRequset;
  final Widget widget;
  const HandledataRequset(
      {super.key, required this.statusRequset, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequset == StatusRequset.laoding
        ? Center(
            child: Lottie.asset(Appimages.loading),
          )
        : statusRequset == StatusRequset.serverfailuer
            ? Center(
                child: Lottie.asset(Appimages.serverfailuer),
              )
            : statusRequset == StatusRequset.offlinefailure
                ? Center(
                    child: Lottie.asset(Appimages.offline),
                  )
                : statusRequset == StatusRequset.failure
                    ? Center(
                        child: Lottie.asset(Appimages.nodata),
                      )
                    : widget;
  }
}








