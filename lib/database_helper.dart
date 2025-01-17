// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
//
// class DatabaseHelper {
//   static final DatabaseHelper instance = DatabaseHelper._init();
//   static Database? _database;
//
//   DatabaseHelper._init();
//
//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDB('user.db');
//     return _database!;
//   }
//
//   Future<Database> _initDB(String filePath) async {
//     final dbPath = await getDatabasesPath();
//     final path = join(dbPath, filePath);
//
//     return await openDatabase(path, version: 1, onCreate: _createDB);
//   }
//
//   Future _createDB(Database db, int version) async {
//     await db.execute('''
//       CREATE TABLE users (
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         username TEXT NOT NULL,
//         password TEXT NOT NULL
//       )
//     ''');
//   }
//
//   Future<int> registerUser(String username, String password) async {
//     final db = await instance.database;
//     return await db.insert('users', {'username': username, 'password': password});
//   }
//
//   Future<bool> loginUser(String username, String password) async {
//     final db = await instance.database;
//     final maps = await db.query(
//       'users',
//       columns: ['id'],
//       where: 'username = ? AND password = ?',
//       whereArgs: [username, password],
//     );
//     return maps.isNotEmpty;
//   }
//
//   Future close() async {
//     final db = await instance.database;
//     db.close();
//   }
// }