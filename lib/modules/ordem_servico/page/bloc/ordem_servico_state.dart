import '../../data/dtos/ordem_servico_dto.dart';

class OrdemServicoState {
  final bool isLoading;
  final String? errorMessage;
  final OrdemServicoDto? ordemServico;

  OrdemServicoState({
    this.isLoading = false,
    this.errorMessage,
    this.ordemServico,
  });

  OrdemServicoState copyWith({
    bool? isLoading,
    String? errorMessage,
    OrdemServicoDto? ordemServico,
  }) {
    return OrdemServicoState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      ordemServico: ordemServico ?? this.ordemServico,
    );
  }
}
