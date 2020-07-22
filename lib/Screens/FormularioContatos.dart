import 'package:bytebank/Componenets/EditorNumero.dart';
import 'package:bytebank/Models/Contato.dart';
import 'package:flutter/material.dart';
import '../Componenets/EditorTexto.dart';
import '../Componenets/CaixaDialogo.dart';

const _tituloAppBar = 'Adicionar Contato';
const _dicaNome = 'Fulano de Tal';
const _dicaConta = '0000';
const _rotuloNome = 'Nome';
const _rotuloConta = 'Número da conta';
const _textBotaoConfirmar = 'Adicionar';

class FormularioContatos extends StatefulWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoNome = TextEditingController();

  @override
  State<StatefulWidget> createState() {
    return FormularioContatosState();
  }
}

class FormularioContatosState extends State<FormularioContatos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            EditorTexto(
              controlador: widget._controladorCampoNome,
              rotulo: _rotuloNome,
              dica: _dicaNome,
            ),
            EditorNumero(
              controlador: widget._controladorCampoNumeroConta,
              rotulo: _rotuloConta,
              dica: _dicaConta,
            ),
            RaisedButton(
              child: Text(_textBotaoConfirmar),
              onPressed: () {
                criaContato(context);
              },
            )
          ],
        ),
      ),
    );
  }

  void criaContato(BuildContext context) {
    final int numeroConta =
        int.tryParse(widget._controladorCampoNumeroConta.text);
    final String nome = widget._controladorCampoNome.text;
    if (numeroConta != null && nome != null) {
      final ContatoCriado = Contato(0, nome, numeroConta);
      Navigator.pop(context, ContatoCriado);
    } else {
      showAlertDialog(context);
    }
  }
}
