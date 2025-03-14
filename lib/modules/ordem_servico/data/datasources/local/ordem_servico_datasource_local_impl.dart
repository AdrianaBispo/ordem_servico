import 'package:ordem_servico/modules/ordem_servico/data/dtos/ordem_servico_dto.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../ordem_servico_datasource.dart';

class OrdemServicoDatasourceLocalImpl implements OrdemServicoDatasource{
  Database? _database;

  OrdemServicoDatasourceLocalImpl();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'ordem_servico.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ordem_servico (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        clienteInformado INTEGER,
        equipamentoInspecionado INTEGER,
        pecasIdentificadas INTEGER,
        fotosEstadoInicial INTEGER,
        descricao TEXT,
        imagePath TEXT
      )
    ''');
  }

  @override
  Future<void> salvarOrdemServico(OrdemServicoDto ordemServico) async {
    final db = await _initDatabase();
    await db.insert('ordem_servico', ordemServico.toMap());
  }
}
