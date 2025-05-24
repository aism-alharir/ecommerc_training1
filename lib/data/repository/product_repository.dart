import '../../features/home/domain/entities/product.dart';

abstract class ProductRepository {
  List<Product> getProducts();
  List<Product> getProductsByCategory(String category);
  Product getProductById(String id);
}