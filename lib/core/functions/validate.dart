import 'package:get/get.dart';

getvalidate(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "username is not validate";
    }
  }

  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "email is not validate";
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "phone is not validate";
    }
  }
  if (val.isEmpty) {
    return "field can't be empty";
  }
  if (val.length < min) {
    return "field can't be less than $min";
  }
  if (val.length > max) {
    return "field can't be great than $max";
  }
}
