import 'package:foodnest/core/classes/statusRequset.dart';

handledata(response) {
  if (response is StatusRequset) {
    return response;
  } else {
    return StatusRequset.success;
  }
}
