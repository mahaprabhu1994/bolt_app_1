

import 'package:bold1/blocs/login/login_modal.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginResponse loginResponse;
  LoginSuccess(this.loginResponse);
}

class LoginFailure extends LoginState {
  final String error;
  LoginFailure(this.error);
}