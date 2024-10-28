abstract class LoginEvent {}

class LoginButtonPressed extends LoginEvent{
  final String userId;
  final String password;

  LoginButtonPressed({required this.userId, required this.password});

}