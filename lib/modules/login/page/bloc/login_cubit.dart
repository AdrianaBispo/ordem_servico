import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ordem_servico/modules/login/data/dtos/user_dto.dart';
import 'package:ordem_servico/modules/login/dto/repositories/login_repository.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository _repository;

  LoginCubit(this._repository) : super(LoginState());

  Future<void> login(UserDto user) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      final result = await _repository.loginUser(userEntity: user);
      if (result.isRight()) {
        result.fold(
          (failure) {
            emit(state.copyWith(
                isLoading: false, errorMessage: 'Usuário ou senha incorretos'));
          },
          (success) {
            emit(state.copyWith(isLoading: false));
            Modular.to.navigate('/home');
          },
        );
      } else {
        emit(state.copyWith(
            isLoading: false, errorMessage: 'Usuário ou senha incorretos'));
      }
    } catch (e) {
      emit(state.copyWith(
          isLoading: false, errorMessage: 'Erro ao fazer login'));
    }
  }
}
