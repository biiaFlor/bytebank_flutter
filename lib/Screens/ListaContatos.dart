import 'package:bytebank/Models/Contato.dart';
import 'package:flutter/material.dart';
import 'FormularioContatos.dart';

const _tituloAppBar = "Lista de Contatos";

class ListaContatos extends StatelessWidget {
  final List<Contato> contatosBanco = List();

  @override
  Widget build(BuildContext context) {
    contatosBanco.add(Contato(0, 'Alex', 1000));
    contatosBanco.add(Contato(0, 'Julia', 1000));

    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final Contato contact = contatosBanco[index];
          return _ContatoItem(contact);
        },
        itemCount: contatosBanco.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => FormularioContatos(),
                ),
              )
              .then(
                (ContatoCriado) => debugPrint(ContatoCriado.toString()),
              );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _ContatoItem extends StatelessWidget {
  final Contato contato;
  _ContatoItem(this.contato);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contato.nome,
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
        subtitle: Text(
          contato.numeroConta.toString(),
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
