class NotificationModel {
  int? notifyId;
  int? notifyUserid;
  String? notifyTitle;
  String? notifyBody;
  String? notifyTime;

  NotificationModel(
      {this.notifyId,
      this.notifyUserid,
      this.notifyTitle,
      this.notifyBody,
      this.notifyTime});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    notifyId = json['notify_id'];
    notifyUserid = json['notify_userid'];
    notifyTitle = json['notify_title'];
    notifyBody = json['notify_body'];
    notifyTime = json['notify_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notify_id'] = this.notifyId;
    data['notify_userid'] = this.notifyUserid;
    data['notify_title'] = this.notifyTitle;
    data['notify_body'] = this.notifyBody;
    data['notify_time'] = this.notifyTime;
    return data;
  }
}