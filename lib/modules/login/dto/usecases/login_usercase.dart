import 'package:dartz/dartz.dart';
import '../entities/user_entity.dart';
import '../errors/login_error.dart';

abstract class LoginUsecase {
  Future<Either<FailureLoginUser, bool>> call({required UserEntity userEntity});
}
