import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../app_router.dart';
import '../data/bloc/splash/splash_bloc.dart';


class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashNavigateToHome) {
          Navigator.pushReplacementNamed(context, AppRouter.login);
        }
      },
      child: const _SplashPageContent(),
    );
  }
}

class _SplashPageContent extends StatelessWidget {
  const _SplashPageContent();

  @override
  Widget build(BuildContext context) {
    // Trigger the navigation event when widget builds
    context.read<SplashBloc>().add(NavigateToHomeEvent());

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/splashScreen1.jpg",
              width: 200,
            ),
          ],
        ),
      ),
    );
  }
}