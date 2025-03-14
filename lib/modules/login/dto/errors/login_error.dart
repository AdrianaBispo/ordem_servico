abstract class FailureLoginUser implements Exception {}

class LoginUsersException implements FailureLoginUser {
  final String message;
  LoginUsersException({required this.message});
}
