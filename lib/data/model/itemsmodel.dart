class ItemsModel {
  String itemsId;
  String itemsName;
  String itemsNameAr;
  String itemsDesc;
  String itemsDescAr;
  String itemsImage;
  String itemsPrice;
  String itemsDiscount;
  String itemsCount;
  String itemsActive;
  String itemsDate;
  String categoriesId;
  String categoriesName;

  ItemsModel({
    required this.itemsId,
    required this.itemsName,
    required this.itemsNameAr,
    required this.itemsDesc,
    required this.itemsDescAr,
    required this.itemsImage,
    required this.itemsPrice,
    required this.itemsDiscount,
    required this.itemsCount,
    required this.itemsActive,
    required this.itemsDate,
    required this.categoriesId,
    required this.categoriesName,
  });

  factory ItemsModel.fromJson(Map<String, dynamic> json) {
    return ItemsModel(
      itemsId: json['items_id'],
      itemsName: json['items_name'],
      itemsNameAr: json['items_name_ar'],
      itemsDesc: json['items_desc'],
      itemsDescAr: json['items_desc_ar'],
      itemsImage: json['items_image'],
      itemsPrice: json['items_price'],
      itemsDiscount: json['items_discount'],
      itemsCount: json['items_count'],
      itemsActive: json['items_active'],
      itemsDate: json['items_date'],
      categoriesId: json['categories_id'],
      categoriesName: json['categories_name'],
    );
  }
}