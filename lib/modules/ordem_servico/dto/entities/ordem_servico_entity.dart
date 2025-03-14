class OrdemServicoEntity {
  int? id;
  bool clienteInformado;
  bool equipamentoInspecionado;
  bool pecasIdentificadas;
  bool fotosEstadoInicial;
  String descricao;
  String imagePath;

  OrdemServicoEntity({
    this.id,
    required this.clienteInformado,
    required this.equipamentoInspecionado,
    required this.pecasIdentificadas,
    required this.fotosEstadoInicial,
    required this.descricao,
    required this.imagePath,
  });
}
