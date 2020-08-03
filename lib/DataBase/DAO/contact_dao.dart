import '../../Models/contact.dart';
import '../app_database.dart';
import 'package:sqflite/sqflite.dart';

class ContactDao {
  static const String tableSQL = 'CREATE TABLE $_tableNome('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_account_number INTEGER)';

  static const String _tableNome = 'contacts';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _account_number = 'account_number';

  Future<int> save(Contact contact) async {
    final Database db = await createDatabase();

    return _toMap(contact, db);
  }

  Future<int> _toMap(Contact contact, Database db) {
    final Map<String, dynamic> contactMap = Map();
    contactMap[_name] = contact.name;
    contactMap[_account_number] = contact.accountNumber;
    return db.insert(_tableNome, contactMap);
  }

  Future<List<Contact>> findAll() async {
    final Database db = await createDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableNome);

    List<Contact> contacts = _toList(result);
    return contacts;
  }

  List<Contact> _toList(List<Map<String, dynamic>> result) {
    final List<Contact> contacts = List();
    for (Map<String, dynamic> row in result) {
      final Contact contact = Contact(
        row[_id],
        row[_name],
        row[_account_number],
      );
      contacts.add(contact);
    }
    return contacts;
  }
}
