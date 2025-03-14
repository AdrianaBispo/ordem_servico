import '../../dtos/user_dto.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'login_datasource.dart';

class LoginDatasourceLocalImpl implements LoginDatasource {
  Database? _database;

  LoginDatasourceLocalImpl();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'users.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE user (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        login TEXT,
        password TEXT
      )
    ''');
  }

  @override
  Future<bool> loginUser({required UserDto user}) async {
    final db = await _initDatabase();
    final results = await db.query(
      'user',
      where: 'login = ? AND password = ?',
      whereArgs: [user.login, user.password],
    );
    if(results.isEmpty){
      int i = await db.insert('users', {'login': user.login, 'password': user.password});
      if(i == 0){
        return false;
      } else {
        return true;
      }
    }
    return results.isNotEmpty;
  }


}
