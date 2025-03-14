import 'package:dartz/dartz.dart';
import '../entities/user_entity.dart';
import '../errors/login_error.dart';

abstract class LoginRepository {
  Future<Either<FailureLoginUser, bool>> loginUser({required UserEntity userEntity});
}
