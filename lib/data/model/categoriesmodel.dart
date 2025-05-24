class CategoriesModel {
  String categoriesId;
  String categoriesName;
  String categoriesNameAr;
  String categoriesImage;

  CategoriesModel({
    required this.categoriesId,
    required this.categoriesName,
    required this.categoriesNameAr,
    required this.categoriesImage,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      categoriesId: json['categories_id'],
      categoriesName: json['categories_name'],
      categoriesNameAr: json['categories_name_ar'],
      categoriesImage: json['categories_image'],
    );
  }
}