import 'package:ecommerc_training/data/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../gitit/gitit.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository _authRepository = locator.get();

  AuthBloc() : super(AuthInitState()) {
    on<AuthLoginRequest>((event, emit) async {
      emit(AuthLoadingState());
      var login = await _authRepository.login(event.username, event.password);
      emit(AuthRequestSuccessState(login));
    });

    on<AuthRegisterRequest>((event, emit) async {
      emit(AuthLoadingState());
      var register = await _authRepository.register(
          event.email, event.password, event.passwordConfirm, event.username);
      emit(AuthRequestSuccessState(register));
    });
  }
}
