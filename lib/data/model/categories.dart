class Categoriesmodel {
  int? categoriesId;
  String? categoriesName;
  String? categoriesNamear;
  String? categoriesImage;
  String? categoriesData;

  Categoriesmodel(
      {this.categoriesId,
      this.categoriesName,
      this.categoriesNamear,
      this.categoriesImage,
      this.categoriesData});

  Categoriesmodel.fromJson(Map<String, dynamic> json) {
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesNamear = json['categories_namear'];
    categoriesImage = json['categories_image'];
    categoriesData = json['categories_data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_namear'] = this.categoriesNamear;
    data['categories_image'] = this.categoriesImage;
    data['categories_data'] = this.categoriesData;
    return data;
  }
}