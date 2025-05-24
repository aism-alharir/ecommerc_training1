import 'package:ecommerc_training/screen/product_details_page.dart';
import 'package:ecommerc_training/screen/profile_page.dart';
import 'package:ecommerc_training/screen/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/bloc/auth_bloc.dart';
import 'data/bloc/home/home_bloc.dart';
import 'data/bloc/home/home_event.dart';
import 'data/repository/Home_Repository.dart';
import 'data/statac/local_product_data_source.dart';
import 'features/home/domain/usecases/get_products.dart';
import 'features/product/domain/entities/product_details.dart';
import 'features/profile/domain/entities/user.dart';
import 'screen/HomePage.dart';
import 'screen/login_screen.dart';
import 'screen/signup_screen.dart';

class AppRouter {
  static const String splash = '/';
  static const String home = '/home';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String productDetails = '/product';
  static const String Profile = '/Profile';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case home:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) {
              // Create all dependencies in the correct order
              final localDataSource = LocalProductDataSourceImpl();
              final repository = ProductRepositoryImpl(
                localDataSource: localDataSource,
              );
              final getProducts = GetProducts(repository);

              return HomeBloc(
                getProducts: getProducts,
                repository: repository,
              )..add(LoadProductsEvent());
            },
            child: const HomePage(),
          ),
        );
      case login:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => AuthBloc(),
                  child: const LoginScreen(),
                ));
      case signup:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => AuthBloc(),
                  child: const SignupScreen(),
                ));
      case productDetails:
        final productDetails = settings.arguments as ProductDetails;
        return MaterialPageRoute(
          builder: (_) => ProductDetailsPage(product: productDetails),
        );

      case Profile:
        final user = settings.arguments as User; // Expect User as an argument
        return MaterialPageRoute(
          builder: (_) => ProfilePage(user: user), // Remove const
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
