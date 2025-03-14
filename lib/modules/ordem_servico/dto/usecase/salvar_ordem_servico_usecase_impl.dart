import 'package:dartz/dartz.dart';

import '../entities/ordem_servico_entity.dart';
import '../errors/salvar_ordem_error.dart';
import '../repositories/ordem_servico_repository.dart';
import 'salvar_ordem_servico_usecase.dart';

class SalvarOrdemServicoUsecaseImpl implements SalvarOrdemServicoUsecase {
  final OrdemServicoRepository repository;

  SalvarOrdemServicoUsecaseImpl(this.repository);

  @override
  Future<Either<FailureSalvarOrdem, void>> call({required OrdemServicoEntity ordemServico}) async {
    return await repository.salvarOrdemServico(ordemServico);
  }
}
