class Addressmodel {
  int? addressId;
  int? addressUser;
  String? addressCity;
  String? addressName;
  String? addressStreet;
  String? addressLat;
  String? addressLong;

  Addressmodel(
      {this.addressId,
      this.addressUser,
      this.addressCity,
      this.addressName,
      this.addressStreet,
      this.addressLat,
      this.addressLong});

  Addressmodel.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    addressUser = json['address_user'];
    addressCity = json['address_city'];
    addressName = json['address_name'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_id'] = this.addressId;
    data['address_user'] = this.addressUser;
    data['address_city'] = this.addressCity;
    data['address_name'] = this.addressName;
    data['address_street'] = this.addressStreet;
    data['address_lat'] = this.addressLat;
    data['address_long'] = this.addressLong;
    return data;
  }
}