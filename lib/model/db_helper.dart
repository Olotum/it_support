import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Future<Database> openConnection() async {
    var path = await getDatabasesPath();
    var dbName = 'parking_database.db';
    var dbPath = '$path$dbName';
    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE tickets (number INTEGER PRIMARY KEY AUTOINCREMENT,vacancyNumber CHAR(4) NOT NULL,vehicleLicenseNumber CHAR(7) NOT NULL,vehicleType VARCHAR(10),entryTime CHAR(5) NOT NULL, departureTime CHAR(5), amount REAL);');
      },
    );
  }
}
