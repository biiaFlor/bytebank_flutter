import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'DAO/contact_dao.dart';

Future<Database> createDatabase() async {
  // final String dbPath = await getDatabasesPath();
  final String path = join(await getDatabasesPath(), 'bytebank.db');

  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(ContactDao.tableSQL);
    },
    version: 1,
    // onDowngrade: onDatabaseDowngradeDelete,
  );
}
