import 'package:flutter/material.dart';

const _tituloAppBar = "Dashboard";

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: Column(
        children: <Widget>[
          Image.asset('images/bytebank_logo.png'),
          Container(
              height: 80,
              width: 100,
              color: Colors.green,
              child: Column(
                children: <Widget>[
                  Icon(Icons.people),
                  Text('Contatos'),
                ],
              )),
        ],
      ),
    );
  }
}
