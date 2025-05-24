part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class LoadProductEvent extends ProductEvent {
  final ProductDetails product;

  const LoadProductEvent(this.product);

  @override
  List<Object> get props => [product];
}