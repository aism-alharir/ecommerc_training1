import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_router.dart';
import '../data/bloc/home/home_bloc.dart';
import '../data/bloc/home/home_event.dart';
import '../data/repository/Home_Repository.dart';
import '../data/statac/local_product_data_source.dart';
import '../features/home/domain/usecases/get_products.dart';
import '../features/home/presentation/widgets/category_chip.dart';
import '../features/home/presentation/widgets/product_card.dart';
import '../features/product/domain/entities/product_details.dart';
import '../features/profile/domain/entities/user.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        // Create all dependencies in order
        final localDataSource = LocalProductDataSourceImpl();
        final repository =
            ProductRepositoryImpl(localDataSource: localDataSource);
        final getProducts = GetProducts(repository);

        return HomeBloc(getProducts: getProducts, repository: repository)
          ..add(LoadProductsEvent());
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Food Commerce',
            style: TextStyle(
              fontFamily: 'Calibri',
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          actions: [
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                // Navigate to ProfilePage with a default User
                Navigator.pushNamed(
                  context,
                  AppRouter.Profile,
                  arguments: User(
                    id: '1',
                    name: 'John Doe',
                    email: 'john.doe@example.com',
                    phone: '098724632',
                    address: '123 Main St, Anytown USA',
                    imageUrl: 'assets/images/logo.png',
                  ),
                );
              },
              tooltip: 'Profile',
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 16.h),
              _buildCategoryChips(),
              SizedBox(height: 16.h),
              Expanded(
                child: _buildProductGrid(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryChips() {
    final categories = ['all', 'shop', 'restaurant', 'cafe', 'fast food'];

    return SizedBox(
      height: 50.h,
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return CategoryChip(
                label: categories[index],
                isSelected: state is HomeLoaded &&
                    state.selectedCategory == categories[index],
                onSelected: () {
                  context
                      .read<HomeBloc>()
                      .add(FilterProductsEvent(categories[index]));
                },
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildProductGrid() {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomeError) {
          return Center(child: Text(state.message));
        } else if (state is HomeLoaded) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 16.h,
              childAspectRatio: 0.7,
            ),
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              final product = state.products[index];
              return ProductCard(
                product: product,
                onTap: () {
                  // Convert Product to ProductDetails for navigation
                  final productDetails = ProductDetails(
                    id: product.id,
                    title: product.title,
                    imageUrl: product.imageUrl,
                    publisherName: product.publisherName,
                    publisherType: product.publisherType,
                    price: product.price,
                    description:
                        product.description ?? 'No description available',
                    preparationTime: product.preparationTime,
                  );
                  Navigator.pushNamed(
                    context,
                    AppRouter
                        .productDetails, // Corrected from AppRoutes to AppRouter
                    arguments: productDetails,
                  );
                },
              );
            },
          );
        } else {
          return const Center(child: Text('No products available'));
        }
      },
    );
  }
}
