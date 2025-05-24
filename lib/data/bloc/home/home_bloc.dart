import 'package:bloc/bloc.dart';
import 'package:ecommerc_training/data/bloc/home/home_event.dart';
import 'package:ecommerc_training/data/repository/Home_Repository.dart';
import 'package:equatable/equatable.dart';
import '../../../features/home/domain/entities/product.dart';
import '../../../features/home/domain/usecases/get_products.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetProducts getProducts;

  HomeBloc({required this.getProducts, required HomeRepository repository})
      : super(HomeInitial()) {
    on<LoadProductsEvent>((event, emit) async {
      emit(HomeLoading());
      try {
        final products = getProducts();
        emit(HomeLoaded(products: products));
      } catch (e) {
        emit(HomeError(message: e.toString()));
      }
    });

    on<FilterProductsEvent>((event, emit) {
      if (state is HomeLoaded) {
        final currentState = state as HomeLoaded;
        if (event.category == 'all') {
          emit(HomeLoaded(products: getProducts()));
        } else {
          final filteredProducts = currentState.products
              .where((product) => product.publisherType == event.category)
              .toList();
          emit(HomeLoaded(
              products: filteredProducts, selectedCategory: event.category));
        }
      }
    });
  }
}
