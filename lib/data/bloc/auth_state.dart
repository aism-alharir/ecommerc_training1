import 'package:dartz/dartz.dart';

abstract class AuthState {}

class AuthInitState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthRequestSuccessState extends AuthState {
  Either<String, String> response;
  AuthRequestSuccessState(this.response);
}
