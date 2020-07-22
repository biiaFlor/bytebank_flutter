import 'package:bytebank/DataBase/CriaBanco.dart';
import 'package:bytebank/Models/Contato.dart';
import 'package:bytebank/Screens/Dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BytebankApp());
  insertContato(Contato(1, 'Beatriz', 1000)).then((IdContato) {
    selectContatos().then((contatos) {});
  });
}

//Tela Inicial
class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Dashboard(),
    );
  }
}
