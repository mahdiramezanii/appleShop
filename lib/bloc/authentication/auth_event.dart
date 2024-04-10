abstract class AuthEvent {}

class RequestLoginEvent extends AuthEvent {
  String username;
  String password;

  RequestLoginEvent({required this.username, required this.password});
}
