import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../features/product/domain/entities/product_details.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<LoadProductEvent>((event, emit) async {
      emit(ProductLoading());
      try {
        // In a real app, this would come from a repository
        await Future.delayed(const Duration(milliseconds: 500));
        emit(ProductLoaded(product: event.product));
      } catch (e) {
        emit(ProductError(message: e.toString()));
      }
    });
  }
}