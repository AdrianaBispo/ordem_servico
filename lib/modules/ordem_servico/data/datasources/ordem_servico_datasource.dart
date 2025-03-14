import '../dtos/ordem_servico_dto.dart';

abstract class OrdemServicoDatasource {
  Future<void> salvarOrdemServico(OrdemServicoDto ordemServico);
}