import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class LoadProductsEvent extends HomeEvent {}

class FilterProductsEvent extends HomeEvent {
  final String category;

  const FilterProductsEvent(this.category);

  @override
  List<Object> get props => [category];
}