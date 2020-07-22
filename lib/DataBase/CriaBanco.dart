import 'package:bytebank/Models/Contato.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> criaBanco() {
  return getDatabasesPath().then((caminhoBanco) {
    final String caminho = join(caminhoBanco, 'bytebank.db');

    openDatabase(caminho, onCreate: (db, version) {
      db.execute('CREATE TABLE Contatos('
          'IdContato INTEGER PRIMARY KEY, '
          'Nome TEXT NOT NULL, '
          'NumeroConta INTEGER NOT NULL)');
    });
  });
}

void insertContato(Contato contato) {
  criaBanco().then((caminhoBanco) {
    final Map<String, dynamic> mapaContato = Map();

    mapaContato['IdContato'] = contato.IdContato;
    caminhoBanco.insert('Contatos', mapaContato);
  });
}
