import 'package:dartz/dartz.dart';
import 'package:ecommerc_training/data/datasource/datasource_auth.dart';
import 'package:ecommerc_training/gitit/gitit.dart';

import '../../util/exception.dart';

abstract class IAuthRepository {
  Future<Either<String, String>> login(String email, String password);
  Future<Either<String, String>> register(
      String email, String password, String confirmPassword, String name);
}

class AuthenticationRepository implements IAuthRepository {
  final IAuthenticationDatasource _datasource = locator.get();

  @override
  Future<Either<String, String>> login(String email, String password) async {
    try {
      String token = await _datasource.login(email, password);
      if (token.isNotEmpty) {
        return right("login");
      } else {
        return left("Error");
      }
    } on ApiException catch (ex) {
      return left('${ex.message}');
    }
  }

  @override
  Future<Either<String, String>> register(String email, String password,
      String confirmPassword, String name) async {
    try {
      await _datasource.register(email, password, confirmPassword, name);
      return right('Done');
    } on ApiException catch (ex) {
      return left('${ex.message}');
    }
  }
}
