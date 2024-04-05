import 'package:dartz/dartz.dart';

abstract class AuthState {}

class InitAuthState extends AuthState {}

class LoadingAuthState extends AuthState {}

class ResponseAuthState extends AuthState {
  Either<String, String> response;

  ResponseAuthState(this.response);
}
