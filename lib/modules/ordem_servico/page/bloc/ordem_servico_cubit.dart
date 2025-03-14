
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/dtos/ordem_servico_dto.dart';
import '../../dto/repositories/ordem_servico_repository.dart';
import 'ordem_servico_state.dart';

class OrdemServicoCubit extends Cubit<OrdemServicoState> {
  final OrdemServicoRepository _repository;

  OrdemServicoCubit(this._repository) : super(OrdemServicoState());

  Future<void> saveOrdemServico(OrdemServicoDto ordemServico) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));
    try {
      await _repository.salvarOrdemServico(ordemServico);
      emit(state.copyWith(isLoading: false, ordemServico: ordemServico));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: 'Erro ao salvar Ordem de Serviço'));
    }
  }
}