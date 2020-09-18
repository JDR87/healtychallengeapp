//import 'dart:html';
import 'dart:io';
import 'package:healtychallengeapp/models/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';


class DatabaseHelper {
  static const _databaseName = 'Usuarios.db';
  static const _databaseVersion = 1;
  DatabaseHelper._();

  static final DatabaseHelper instance = DatabaseHelper._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async{
    Directory dataDirectory = await getApplicationDocumentsDirectory();
    String dbPath = join(dataDirectory.path, _databaseName);
    return await openDatabase(dbPath, version:_databaseVersion, onCreate: _onCreateDB);
  }

  _onCreateDB(Database db, int version) async{
    await db.execute('''
        CREATE TABLE ${Usuario.tblUser}(
          ${Usuario.colId} INTEGER PRIMARY KEY AUTOINCREMENT,
          ${Usuario.colName} TEXT NOT NULL,
          ${Usuario.colLastname} TEXT NOT NULL,
          ${Usuario.colMail} TEXT NOT NULL,
          ${Usuario.colPassword} TEXT NOT NULL
          )
        ''');
  }

  Future<int> insertContact(Usuario register) async{
    Database db = await database;
    return await db.insert(Usuario.tblUser, register.toMap());
  }

  Future<int> updateContact(Usuario register) async{
    Database db = await database;
    return await db.update(Usuario.tblUser, register.toMap(),
        where: '${Usuario.colId}=?', whereArgs: [register.id]);
  }

  Future<int> deleteContact(int id) async{
    Database db = await database;
    return await db.delete(Usuario.tblUser,
        where: '${Usuario.colId}=?', whereArgs: [id]);
  }

  Future<List<Usuario>> fetchRegisters() async{
    Database db = await database;
    List<Map> registers = await db.query(Usuario.tblUser);
    return registers.length == 0
        ?[]
        : registers.map((e) => Usuario.fromMap(e)).toList();
  }

}
