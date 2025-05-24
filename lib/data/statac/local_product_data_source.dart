// local_product_data_source.dart
import '../model/product_model.dart';

abstract class LocalProductDataSource {
  List<ProductModel> getProducts();
  List<ProductModel> getProductsByCategory(String category);
  ProductModel getProductById(String id);
}

class LocalProductDataSourceImpl implements LocalProductDataSource {
  // ... existing implementation remains unchanged ...
  @override
  List<ProductModel> getProducts() {
    return _mockProducts;
  }

  @override
  List<ProductModel> getProductsByCategory(String category) {
    return _mockProducts
        .where((product) => product.publisherType == category)
        .toList();
  }

  @override
  ProductModel getProductById(String id) {
    return _mockProducts.firstWhere((product) => product.id == id);
  }

  final List<ProductModel> _mockProducts = [
    ProductModel(
      id: '1',
      title: 'Cheeseburger',
      imageUrl: 'assets/images/double-cheeseburger.jpg',
      publisherName: 'Burger King',
      publisherType: 'fast food',
      price: 5.99,
      description:
          'Classic cheeseburger with lettuce, tomato, and special sauce',
      preparationTime: 10,
    ),
    ProductModel(
      id: '2',
      title: 'Margherita Pizza',
      imageUrl: 'assets/images/top-view-delicious-pizza-with-fresh-cheese.jpg',
      publisherName: 'Pizza Hut',
      publisherType: 'restaurant',
      price: 12.99,
      description: 'Traditional pizza with tomato sauce, mozzarella, and basil',
      preparationTime: 20,
    ),
    ProductModel(
      id: '3',
      title: 'Espresso',
      imageUrl: 'assets/images/cup-coffee-with-heart-drawn-foam.jpg',
      publisherName: 'Starbucks',
      publisherType: 'cafe',
      price: 3.50,
      description:
          'Strong black coffee made by forcing steam through ground coffee beans',
      preparationTime: 5,
    ),
    ProductModel(
      id: '4',
      title: 'Chocolate Croissant',
      imageUrl:
          'assets/images/homemade-french-croissant-stuffed-with-chocolate-butter-indulgent-refreshment-generated-by-ai.jpg',
      publisherName: 'Paris Bakery',
      publisherType: 'shop',
      price: 4.25,
      description: 'Flaky croissant with rich chocolate filling',
    ),
    ProductModel(
      id: '5',
      title: 'Chicken Wings',
      imageUrl:
          'assets/images/fried-chicken-with-variety-sauces-french-fries.jpg',
      publisherName: 'KFC',
      publisherType: 'fast food',
      price: 8.99,
      description: 'Crispy fried chicken wings with your choice of sauce',
      preparationTime: 15,
    ),
    ProductModel(
      id: '6',
      title: 'Cappuccino',
      imageUrl: 'assets/images/front-view-coffee-latte-with-coffee-beans.jpg',
      publisherName: 'Coffee Bean',
      publisherType: 'cafe',
      price: 4.50,
      description: 'Espresso with steamed milk and foam',
      preparationTime: 7,
    ),
  ];
}
