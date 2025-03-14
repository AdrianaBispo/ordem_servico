import 'package:dartz/dartz.dart';
import '../../dto/entities/ordem_servico_entity.dart';
import '../../dto/errors/salvar_ordem_error.dart';
import '../../dto/repositories/ordem_servico_repository.dart';
import '../datasources/ordem_servico_datasource.dart';
import '../dtos/ordem_servico_dto.dart';

class OrdemServicoRepositoryImpl implements OrdemServicoRepository {
  final OrdemServicoDatasource ordemServicoDatasource;

  OrdemServicoRepositoryImpl({required this.ordemServicoDatasource});
  @override
  Future<Either<FailureSalvarOrdem, void>> salvarOrdemServico(
      OrdemServicoEntity ordemServico) async {
    try {
      await ordemServicoDatasource
          .salvarOrdemServico(ordemServico as OrdemServicoDto);
      return const Right(null);
    } catch (e) {
      return Left(SalvarOrdemsException(message: e.toString()));
    }
  }
}
