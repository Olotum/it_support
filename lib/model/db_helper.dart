import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

//Este arquivo contém a classe DbHelper, que lida com a abertura da conexão com o banco de dados SQLite.
class DbHelper {
  // Método estático para abrir a conexão com o banco de dados.
  static Future<Database> openConnection() async {
    // Obtém o caminho do banco de dados.
    final dbPath = await getDatabasesPath();
    // Junta o caminho do banco de dados com o nome do banco.
    final path = join(dbPath, 'it_support.db');

    // Abre o banco de dados e cria a tabela 'tickets' se não existir.
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE tickets('
          'id INTEGER PRIMARY KEY AUTOINCREMENT, '
          'issueDescription TEXT, '
          'requesterName TEXT, '
          'requestTime TEXT)',
        );
      },
    );
  }
}
