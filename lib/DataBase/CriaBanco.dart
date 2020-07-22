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

Future<Database> insertContato(Contato contato) {
  criaBanco().then((caminhoBanco) {
    final Map<String, dynamic> mapaContato = Map();

    mapaContato['Nome'] = contato.nome;
    mapaContato['NumeroConta'] = contato.numeroConta;

    return caminhoBanco.insert('Contatos', mapaContato);
  });
}

Future<List<Contato>> selectContatos() {
  criaBanco().then((db) {
    return db.query('Contatos').then((maps) {
      final List<Contato> contatosBanco = List();
      for (Map<String, dynamic> map in maps) {
        final Contato contato = Contato(
          map['IdContato'],
          map['nome'],
          map['numeroConta'],
        );
        contatosBanco.add(contato);
      }
      return contatosBanco;
    });
  });
}
