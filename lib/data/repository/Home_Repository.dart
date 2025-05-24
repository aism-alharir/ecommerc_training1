
// home_repository.dart
import '../statac/local_product_data_source.dart';
import '../../features/home/domain/entities/product.dart';

abstract class HomeRepository {
  List<Product> getProducts();
  List<Product> getProductsByCategory(String category);
  Product getProductById(String id);
}

class ProductRepositoryImpl implements HomeRepository {
  final LocalProductDataSource localDataSource;

  ProductRepositoryImpl({required this.localDataSource});

  @override
  List<Product> getProducts() {
    return localDataSource.getProducts()
        .map((model) => model.toEntity())
        .toList();
  }

  @override
  List<Product> getProductsByCategory(String category) {
    return localDataSource.getProductsByCategory(category)
        .map((model) => model.toEntity())
        .toList();
  }

  @override
  Product getProductById(String id) {
    return localDataSource.getProductById(id).toEntity();
  }
}