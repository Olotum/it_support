import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static Future<Database> openConnection() async {
    var path = await getDatabasesPath();
    var dbName = 'tickets_database.db'; // Nome do banco de dados atualizado
    var dbPath = join(path, dbName); // Corrigido a junção do caminho e nome do banco de dados
    
    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE tickets ('
          'id INTEGER PRIMARY KEY AUTOINCREMENT, '
          'issueDescription TEXT NOT NULL, '
          'userName TEXT NOT NULL, '
          'requestTime TEXT'
          ');'
        );
      },
    );
  }
}
