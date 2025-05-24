// lib/features/home/domain/usecases/get_products.dart
import '../../../../data/repository/Home_Repository.dart';
import '../entities/product.dart';

class GetProducts {
  final HomeRepository repository;

  GetProducts(this.repository);

  List<Product> call() {
    return repository.getProducts();
  }
}