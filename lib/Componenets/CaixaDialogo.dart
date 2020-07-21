import 'package:flutter/material.dart';

showAlertDialog(BuildContext context) {
  // configura o button
  Widget botao = FlatButton(
      child: Text("Ok"),
      onPressed: () {
        Navigator.of(context).pop();
      });
  // Caixa de Alerta
  AlertDialog alerta = AlertDialog(
    title: Text("Ops, Parece que temos problemas!"),
    content: Text("Todos os campos devem ser preenchidos."),
    actions: [
      botao,
    ],
  );
  // exibe a caixa de alerta
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}
