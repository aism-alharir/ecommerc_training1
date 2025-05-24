import 'package:dio/dio.dart';

class DioProvider {
  static Dio creatDioWithoutHeader() {
    Dio dio =
        Dio(BaseOptions(baseUrl: 'https://api.githup.com'));
    return dio;
  }
}
