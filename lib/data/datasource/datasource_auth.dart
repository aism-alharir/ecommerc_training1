import 'package:dio/dio.dart';
import 'package:ecommerc_training/util/auth-manager.dart';
import 'package:ecommerc_training/util/dio.dart';

import '../../util/exception.dart';

abstract class IAuthenticationDatasource {
  Future<void> register(
      String email, String password, String confirmPassword, String name);
  Future<String> login(String email, String password);
}

class AuthenticationRemote extends IAuthenticationDatasource {
  @override
  final Dio _dio = DioProvider.creatDioWithoutHeader();

  Future<String> login(String email, String password) async {
    try {
      final response = await _dio.post('collections/users/records', data: {
        'email': email,
        'password': password,
      });
      if (response.statusCode == 200) {
        AuthManager.saveToken(response.data?['token']);
        return response.data?['token'];
      }
    } on DioError catch (ex) {
      throw ApiException(ex.response?.data['message'],ex.response);
    }
    return '';
  }

  @override
  Future<void> register(String email, String password, String confirmPassword,
      String name) async {
    try {
      final response = await _dio.post('collections/users/records', data: {
        'email': email,
        'username': name,
        'password': password,
        'confirmPassword': confirmPassword,
      });
      if (response.statusCode == 200) {
        print(response.data);
        login(email, password);
      }
    } on DioError catch (ex) {
      throw ApiException(ex.response?.data['message'],ex.response);
    }
  }
}
