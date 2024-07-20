import 'package:it_support/model/db_helper.dart';
import 'package:it_support/model/ticket.dart';

class TicketRepository {
  static Future<int> insert(Ticket ticket) async {
    final db = await DbHelper.openConnection();
    return db.insert('tickets', ticket.toMap());
  }
}
