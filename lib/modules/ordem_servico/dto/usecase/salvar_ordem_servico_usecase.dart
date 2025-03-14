import 'package:dartz/dartz.dart';

import '../entities/ordem_servico_entity.dart';
import '../errors/salvar_ordem_error.dart';

abstract class SalvarOrdemServicoUsecase {
  Future<Either<FailureSalvarOrdem, void>> call({required OrdemServicoEntity ordemServico});
}
