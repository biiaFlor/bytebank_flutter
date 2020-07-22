import 'package:flutter/material.dart';
import 'Screens/TelaInicial.dart';

void main() => runApp(BytebankApp());

//Tela Inicial
class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: TelaInicial(),
    );
  }
}
