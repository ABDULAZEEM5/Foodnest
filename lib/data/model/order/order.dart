class Ordermodel {
  int? orderId;
  int? orderPrice;
  int? orderStatus;
  int? orderUser;
  int? orderCoupon;
  int? orderAddress;
  int? orderPaymentmethod;
  int? orderType;
  String? orderTime;
  int? orderTotalprcie;
  int? orderPricedelivery;
  int? rating;
  String? ratingComment;
  int? addressId;
  int? addressUser;
  String? addressCity;
  String? addressName;
  String? addressStreet;
  String? addressLat;
  String? addressLong;

  Ordermodel(
      {this.orderId,
      this.orderPrice,
      this.orderStatus,
      this.orderUser,
      this.orderCoupon,
      this.orderAddress,
      this.orderPaymentmethod,
      this.orderType,
      this.orderTime,
      this.orderTotalprcie,
      this.orderPricedelivery,
      this.rating,
      this.ratingComment,
      this.addressId,
      this.addressUser,
      this.addressCity,
      this.addressName,
      this.addressStreet,
      this.addressLat,
      this.addressLong});

  Ordermodel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    orderPrice = json['order_price'];
    orderStatus = json['order_status'];
    orderUser = json['order_user'];
    orderCoupon = json['order_coupon'];
    orderAddress = json['order_address'];
    orderPaymentmethod = json['order_paymentmethod'];
    orderType = json['order_type'];
    orderTime = json['order_time'];
    orderTotalprcie = json['order_totalprcie'];
    orderPricedelivery = json['order_pricedelivery'];
    rating = json['rating'];
    ratingComment = json['rating_comment'];
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
    data['order_id'] = this.orderId;
    data['order_price'] = this.orderPrice;
    data['order_status'] = this.orderStatus;
    data['order_user'] = this.orderUser;
    data['order_coupon'] = this.orderCoupon;
    data['order_address'] = this.orderAddress;
    data['order_paymentmethod'] = this.orderPaymentmethod;
    data['order_type'] = this.orderType;
    data['order_time'] = this.orderTime;
    data['order_totalprcie'] = this.orderTotalprcie;
    data['order_pricedelivery'] = this.orderPricedelivery;
    data['rating'] = this.rating;
    data['rating_comment'] = this.ratingComment;
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