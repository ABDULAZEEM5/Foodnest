class Favoritesmodele {
  int? favoritesId;
  int? favoritesUser;
  int? favoritesItems;
  int? itemsId;
  String? itemsName;
  String? itemsNamear;
  int? itemsDiscount;
  int? itemsActive;
  int? itemsPrice;
  String? itemsImage;
  String? itemsDescription;
  String? itemsDescriptionar;
  int? itemsCount;
  String? itemsDatatime;
  int? itemsCatid;
  int? userId;

  Favoritesmodele(
      {this.favoritesId,
      this.favoritesUser,
      this.favoritesItems,
      this.itemsId,
      this.itemsName,
      this.itemsNamear,
      this.itemsDiscount,
      this.itemsActive,
      this.itemsPrice,
      this.itemsImage,
      this.itemsDescription,
      this.itemsDescriptionar,
      this.itemsCount,
      this.itemsDatatime,
      this.itemsCatid,
      this.userId});

  Favoritesmodele.fromJson(Map<String, dynamic> json) {
    favoritesId = json['favorites_id'];
    favoritesUser = json['favorites_user'];
    favoritesItems = json['favorites_items'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNamear = json['items_namear'];
    itemsDiscount = json['items_discount'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsImage = json['items_image'];
    itemsDescription = json['items_description'];
    itemsDescriptionar = json['items_descriptionar'];
    itemsCount = json['items_count'];
    itemsDatatime = json['items_datatime'];
    itemsCatid = json['items_catid'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['favorites_id'] = this.favoritesId;
    data['favorites_user'] = this.favoritesUser;
    data['favorites_items'] = this.favoritesItems;
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_namear'] = this.itemsNamear;
    data['items_discount'] = this.itemsDiscount;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['items_image'] = this.itemsImage;
    data['items_description'] = this.itemsDescription;
    data['items_descriptionar'] = this.itemsDescriptionar;
    data['items_count'] = this.itemsCount;
    data['items_datatime'] = this.itemsDatatime;
    data['items_catid'] = this.itemsCatid;
    data['user_id'] = this.userId;
    return data;
  }
}