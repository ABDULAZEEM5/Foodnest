
class Itemsmodle {
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

  Itemsmodle(
      {this.itemsId,
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
      this.itemsCatid});

  Itemsmodle.fromJson(Map<String, dynamic> json) {
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    return data;
  }
}