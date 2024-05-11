abstract class AuthEvent {}

class RequestLoginEvent extends AuthEvent {
  String username;
  String password;

  RequestLoginEvent({required this.username, required this.password});
}

class RegisterUserEvent extends AuthEvent {
  String username;
  String password;
  String confirmPassword;

  RegisterUserEvent({
    required this.username,
    required this.password,
    required this.confirmPassword,
  });
}
