// product_model.dart
import '../../features/home/domain/entities/product.dart';

class ProductModel {
  // ... existing fields and methods ...
  final String id;
  final String title;
  final String imageUrl;
  final String publisherName;
  final String publisherType; // shop, restaurant, cafe, fast food
  final double price;
  final String? description;
  final int? preparationTime; // in minutes

  ProductModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.publisherName,
    required this.publisherType,
    required this.price,
    this.description,
    this.preparationTime,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      imageUrl: json['imageUrl'],
      publisherName: json['publisherName'],
      publisherType: json['publisherType'],
      price: json['price'],
      description: json['description'],
      preparationTime: json['preparationTime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'publisherName': publisherName,
      'publisherType': publisherType,
      'price': price,
      'description': description,
      'preparationTime': preparationTime,
    };
  }

  Product toEntity() {
    return Product(
      id: id,
      title: title,
      imageUrl: imageUrl,
      publisherName: publisherName,
      publisherType: publisherType,
      price: price,
      description: description,
      preparationTime: preparationTime,
    );
  }
}
