import '../../dtos/user_dto.dart';

abstract class LoginDatasource {
  Future<bool> loginUser({required UserDto user});
}