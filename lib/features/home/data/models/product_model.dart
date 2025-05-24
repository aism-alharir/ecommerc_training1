// lib/features/home/data/models/product_model.dart
import '../../domain/entities/product.dart';

class ProductModel {
  final String id;
  final String title;
  final String imageUrl;
  final String publisherName;
  final String publisherType;
  final double price;
  final String? description;
  final int? preparationTime;

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

  // Add a method to convert model to entity
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