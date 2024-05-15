import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:upd8_teste/app/models/user_model.dart';

class DatabaseService {
  final _dbName = 'lavvi_database.db';

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, _dbName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createTable,
    );
  }

  Future<void> _createTable(Database db, int version) async {
    try {
      await db.execute(
        'CREATE TABLE users(id INTEGER AUTOINCREMENT PRIMARY KEY, fullname TEXT NOT NULL, document TEXT NOT NULL, phone TEXT NOT NULL, email TEXT UNIQUE NOT NULL, token TEXT NOT NULL, username TEXT)',
      );
    } on DatabaseException {
      rethrow;
    } catch (err) {
      rethrow;
    }
  }

  Future<void> insertUsers(UserModel user) async {
    await _database!.insert('users', user.toMap());
  }

  Future<UserModel> loginUser(String email, String password) async {
    try {
      final results = await _database!
          .query('users', where: 'email = ?', whereArgs: [email]);

      if (results.isEmpty) {
        throw 'Usuário não encontrado';
      }
      final user = UserModel.fromMap(results.first);

      if (user.password == password) {
        return user;
      } else {
        throw 'Senha incorreta';
      }
    } on DatabaseException {
      rethrow;
    } catch (err) {
      rethrow;
    }
  }
}
