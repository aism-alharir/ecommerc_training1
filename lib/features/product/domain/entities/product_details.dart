class ProductDetails {
  final String id;
  final String title;
  final String imageUrl;
  final String publisherName;
  final String publisherType;
  final double price;
  final String description;
  final int? preparationTime;

  ProductDetails({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.publisherName,
    required this.publisherType,
    required this.price,
    required this.description,
    this.preparationTime,
  });
}