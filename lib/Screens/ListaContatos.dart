import 'package:flutter/material.dart';
import 'FormularioContatos.dart';

const _tituloAppBar = "Lista de Contatos";

class ListaContatos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              title: Text(
                'Alex',
                style: TextStyle(fontSize: 24.0),
              ),
              subtitle: Text(
                '1000',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => FormularioContatos(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
