import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:foodnest/core/classes/statusRequset.dart';
import 'package:foodnest/core/functions/checkinternet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequset, Map>> postdata(String linkurl, Map data) async {
    try {
      if (await checkinternet()) {
        var respons = await http.post(Uri.parse(linkurl), body: data);
        if (respons.statusCode == 200 || respons.statusCode == 201) {
          Map responsbody = jsonDecode(respons.body);
          return right(responsbody);
        } else {
          return left(StatusRequset.serverfailuer);
        }
      } else {
        return left(StatusRequset.offlinefailure);
      }
    } catch (_) {
      return left(StatusRequset.serverfailuer);
    }
  }
}
