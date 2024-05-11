import 'package:apple_shop/bloc/authentication/auth_event.dart';
import 'package:apple_shop/bloc/authentication/auth_state.dart';
import 'package:apple_shop/data/repository/authentication_repository.dart';
import 'package:apple_shop/di/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  IAuthenticatinRepository iAuth = locator.get();
  AuthBloc() : super(InitAuthState()) {
    on<RequestLoginEvent>((event, emit) async {
      emit(LoadingAuthState());
      var response = await iAuth.login(event.username, event.password);
      emit(ResponseAuthState(response));
    });

    on<RegisterUserEvent>((event, emit) async {
      emit(LoadingAuthState());
      var response = await iAuth.register(
        event.username,
        event.password,
        event.confirmPassword,
      );
      emit(ResponseAuthState(response));
    });
  }
}
