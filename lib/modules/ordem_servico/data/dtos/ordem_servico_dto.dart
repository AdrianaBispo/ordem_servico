import 'package:ordem_servico/modules/ordem_servico/dto/entities/ordem_servico_entity.dart';

class OrdemServicoDto extends OrdemServicoEntity {
  int? id;
  bool clienteInformado;
  bool equipamentoInspecionado;
  bool pecasIdentificadas;
  bool fotosEstadoInicial;
  String descricao;
  String imagePath;

  OrdemServicoDto({
    this.id,
    required this.clienteInformado,
    required this.equipamentoInspecionado,
    required this.pecasIdentificadas,
    required this.fotosEstadoInicial,
    required this.descricao,
    required this.imagePath,
  }) : super(
          id: id,
          clienteInformado: clienteInformado,
          equipamentoInspecionado: equipamentoInspecionado,
          pecasIdentificadas: pecasIdentificadas,
          fotosEstadoInicial: fotosEstadoInicial,
          descricao: descricao,
          imagePath: imagePath,
        );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'clienteInformado': clienteInformado ? 1 : 0,
      'equipamentoInspecionado': equipamentoInspecionado ? 1 : 0,
      'pecasIdentificadas': pecasIdentificadas ? 1 : 0,
      'fotosEstadoInicial': fotosEstadoInicial ? 1 : 0,
      'descricao': descricao,
      'imagePath': imagePath,
    };
  }

  factory OrdemServicoDto.fromMap(Map<String, dynamic> map) {
    return OrdemServicoDto(
      id: map['id'],
      clienteInformado: map['clienteInformado'] == 1,
      equipamentoInspecionado: map['equipamentoInspecionado'] == 1,
      pecasIdentificadas: map['pecasIdentificadas'] == 1,
      fotosEstadoInicial: map['fotosEstadoInicial'] == 1,
      descricao: map['descricao'],
      imagePath: map['imagePath'],
    );
  }
}
