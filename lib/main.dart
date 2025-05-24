import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_router.dart';
import 'data/bloc/splash/splash_bloc.dart';
import 'gitit/gitit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await getInitit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => SplashBloc()),
            ],
            child: const MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'E-Commerce Training',
              initialRoute: AppRouter.splash,
              onGenerateRoute: AppRouter.generateRoute,
            ),
          );
        });
  }
}
