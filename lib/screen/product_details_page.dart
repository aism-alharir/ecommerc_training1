import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../data/bloc/Prouduct/product_bloc.dart';
import '../features/product/domain/entities/product_details.dart';

class ProductDetailsPage extends StatelessWidget {
  final ProductDetails product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc()..add(LoadProductEvent(product)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Product Details',
            style: TextStyle(
              fontFamily: 'Calibri',
              fontSize: 20.sp,
            ),
          ),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductError) {
              return Center(child: Text(state.message));
            } else if (state is ProductLoaded) {
              return SingleChildScrollView(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildProductImage(state.product),
                    SizedBox(height: 16.h),
                    _buildProductTitle(state.product),
                    SizedBox(height: 8.h),
                    _buildPublisherInfo(state.product),
                    SizedBox(height: 16.h),
                    _buildDescription(state.product),
                    SizedBox(height: 16.h),
                    if (state.product.preparationTime != null)
                      _buildPreparationTime(state.product),
                    SizedBox(height: 24.h),
                    _buildPriceAndAddToCart(state.product),
                  ],
                ),
              );
            } else {
              return const Center(child: Text('Product not available'));
            }
          },
        ),
      ),
    );
  }

  Widget _buildProductImage(ProductDetails product) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: Image.asset(
        product.imageUrl,
        height: 250.h,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildProductTitle(ProductDetails product) {
    return Text(
      product.title,
      style: TextStyle(
        fontFamily: 'Calibri',
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildPublisherInfo(ProductDetails product) {
    return Row(
      children: [
        Icon(Icons.store, size: 18.w, color: Colors.grey),
        SizedBox(width: 4.w),
        Text(
          product.publisherName,
          style: TextStyle(
            fontFamily: 'Calibri',
            fontSize: 16.sp,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildDescription(ProductDetails product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: TextStyle(
            fontFamily: 'Calibri',
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          product.description,
          style: TextStyle(
            fontFamily: 'Calibri',
            fontSize: 16.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildPreparationTime(ProductDetails product) {
    return Row(
      children: [
        Icon(Icons.timer, size: 18.w, color: Colors.grey),
        SizedBox(width: 4.w),
        Text(
          'Preparation time: ${product.preparationTime} minutes',
          style: TextStyle(
            fontFamily: 'Calibri',
            fontSize: 16.sp,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildPriceAndAddToCart(ProductDetails product) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '\$${product.price.toStringAsFixed(2)}',
          style: TextStyle(
            fontFamily: 'Calibri',
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // Add to cart functionality
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          ),
          child: Text(
            'Add to Cart',
            style: TextStyle(
              fontFamily: 'Calibri',
              fontSize: 16.sp,
            ),
          ),
        ),
      ],
    );
  }
}
