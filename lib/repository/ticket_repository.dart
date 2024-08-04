import 'package:it_support/model/db_helper.dart';
import 'package:it_support/model/ticket.dart';
//Este arquivo contém a classe TicketRepository, que lida com as operações CRUD no banco de dados.
class TicketRepository {
  // Insere um novo chamado no banco de dados.
  static Future<int> insert(Ticket ticket) async {
    final db = await DbHelper.openConnection();
    return db.insert('tickets', ticket.toMap());
  }

  // Recupera todos os chamados do banco de dados.
  static Future<List<Ticket>> findAll() async {
    final db = await DbHelper.openConnection();
    final result = await db.query('tickets');
    return result.map((item) => Ticket.fromMap(item)).toList();
  }

  // Remove um chamado do banco de dados pelo ID.
  static Future<int> remove(int id) async {
    final db = await DbHelper.openConnection();
    return await db.delete(
      'tickets',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
