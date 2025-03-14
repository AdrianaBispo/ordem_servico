import 'package:dartz/dartz.dart';
import 'package:ordem_servico/modules/ordem_servico/dto/errors/salvar_ordem_error.dart';

import '../entities/ordem_servico_entity.dart';

abstract class OrdemServicoRepository {
  Future<Either<FailureSalvarOrdem,void>> salvarOrdemServico(OrdemServicoEntity ordemServico);
}
