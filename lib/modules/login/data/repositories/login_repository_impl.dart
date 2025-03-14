import 'package:dartz/dartz.dart';
import 'package:ordem_servico/modules/login/data/dtos/user_dto.dart';
import 'package:ordem_servico/modules/login/dto/entities/user_entity.dart';
import 'package:ordem_servico/modules/login/dto/errors/login_error.dart';

import '../../dto/repositories/login_repository.dart';
import '../datasources/local/login_datasource.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDatasource loginDataSource;

  LoginRepositoryImpl({required this.loginDataSource});

  @override
Future<Either<FailureLoginUser, bool>> loginUser({required UserEntity userEntity}) async{  
   try {
      final bool user = await loginDataSource.loginUser(user: userEntity as UserDto);
      return Right(user);
    } catch (e) {
      return Left(LoginUsersException(message: e.toString()));
    }
  }
  
}