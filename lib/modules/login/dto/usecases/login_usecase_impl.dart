import 'package:dartz/dartz.dart';
import 'package:ordem_servico/modules/login/dto/repositories/login_repository.dart';

import '../entities/user_entity.dart';
import '../errors/login_error.dart';
import 'login_usercase.dart';



class LoginUsecaseImpl implements LoginUsecase {
  final LoginRepository _repository;

  LoginUsecaseImpl(this._repository);

  @override
  Future<Either<FailureLoginUser, bool>> call({required UserEntity userEntity}) async{
    return await _repository.loginUser(userEntity: userEntity);
  }
}

