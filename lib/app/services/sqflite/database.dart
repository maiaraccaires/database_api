import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/user_model.dart';

class DatabaseSQLFlite {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'myapplication.db');
    _database = await openDatabase(path, version: 1);
    return _database!;
  }

  Future<void> createTableUsers(Database db, int version) async {
    await db.execute(
        'CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT,username VARCHAR(100) UNIQUE NOT NULL,email VARCHAR(100) UNIQUE NOT NULL,token VARCHAR(50) NOT NULL,fullname VARCHAR(100) NOT NULL,document VARCHAR(11) NOT NULL,phone VARCHAR(13) NOT NULL)');
  }

  Future<void> insertUser(UserModel user) async {
    await _database!.database.rawInsert(
        'INSERT INTO users(fullname, document, phone, email, token, username) VALUES("${user.fullname}", "${user.document}", "${user.phone}", "${user.email}", "${user.password}", "${user.username}")');
  }

  Future<UserModel?> login(String email, String password) async {
    final userMap = await _database!.database.rawQuery(
        'SELECT * FROM users WHERE email = "$email" AND token = "$password"');

    if (userMap.isNotEmpty) {
      final user = UserModel.fromMap(userMap.first);

      return user;
    } else {
      return null;
    }
  }

  Future<void> closeDatabase() async {
    await _database!.close();
  }
}
