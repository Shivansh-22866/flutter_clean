import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean/core/useCase/usecase.dart';
import 'package:flutter_clean/features/auth/domain/entities/user.dart';
import 'package:flutter_clean/features/auth/domain/useCases/current_user.dart';
import 'package:flutter_clean/features/auth/domain/useCases/user_login.dart';
import 'package:flutter_clean/features/auth/domain/useCases/user_sign_up.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserLogin _userLogin;
  final CurrentUser _currentUser;
  AuthBloc({
    required UserSignUp userSignup,
    required UserLogin userLogin,
    required CurrentUser currentUser,
  })  : _userSignUp = userSignup,
        _userLogin = userLogin,
        _currentUser = currentUser,
        super(AuthInitial()) {
    on<AuthSignUp>(_onAuthSignUp);
    on<AuthLogin>(_onAuthLogin);
    on<AuthIsUserLoggedIn>(_isUserLoggedIn);
  }

  void _isUserLoggedIn(
      AuthIsUserLoggedIn event, Emitter<AuthState> emit) async {
    final res = await _currentUser(NoParams());
    res.fold((l) => emit(AuthFailure(l.message)), (r) {
      emit(AuthSuccess(r));
      print(r.name);
      print(r.email);
    });
  }

  void _onAuthSignUp(AuthSignUp event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final res = await _userSignUp(UserSignUpParams(
        password: event.password, email: event.email, name: event.name));
    res.fold((fail) => emit(AuthFailure(fail.message)),
        (user) => emit(AuthSuccess(user)));
  }

  void _onAuthLogin(AuthLogin event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final res = await _userLogin(
        UserLoginParams(email: event.email, password: event.password));

    res.fold((l) => emit(AuthFailure(l.message)), (r) => emit(AuthSuccess(r)));
  }
}
