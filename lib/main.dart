import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

//Tela Inicial
class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: ListaTransferencias(),
    );
  }
}

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = List();

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future<Transferencia> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));
          future.then((transferenciaRecebida) {
            if (transferenciaRecebida != null) {
              setState(() {
                widget._transferencias.add(transferenciaRecebida);
              });
            }
          });
        },
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);
}

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData icone;

  Editor({this.controlador, this.rotulo, this.dica, this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          labelText: rotulo,
          hintText: dica,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

// class FormularioTransferencia extends StatelessWidget {
//   final TextEditingController _controladorCampoNumeroConta =
//       TextEditingController();
//   final TextEditingController _controladorCampoValor = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Criando Transferência'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             Editor(
//               controlador: _controladorCampoNumeroConta,
//               rotulo: 'Numero da conta',
//               dica: '0000',
//             ),
//             Editor(
//               controlador: _controladorCampoValor,
//               rotulo: 'Valor',
//               dica: '0.00',
//               icone: Icons.monetization_on,
//             ),
//             RaisedButton(
//               child: Text('Confirmar'),
//               onPressed: () {
//                 criaTransferencia(context);
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
//   void criaTransferencia(BuildContext context) {
//     final int numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
//     final double valor = double.tryParse(_controladorCampoValor.text);
//     if (numeroConta != null && valor != null) {
//       final transferenciaCriada = Transferencia(valor, numeroConta);
//       Navigator.pop(context, transferenciaCriada);
//     } else {
//       showAlertDialog(context);
//     }
//   }
// }

class FormularioTransferencia extends StatefulWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Transferência'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controlador: widget._controladorCampoNumeroConta,
              rotulo: 'Numero da conta',
              dica: '0000',
            ),
            Editor(
              controlador: widget._controladorCampoValor,
              rotulo: 'Valor',
              dica: '0.00',
              icone: Icons.monetization_on,
            ),
            RaisedButton(
              child: Text('Confirmar'),
              onPressed: () {
                criaTransferencia(context);
              },
            )
          ],
        ),
      ),
    );
  }

  void criaTransferencia(BuildContext context) {
    final int numeroConta =
        int.tryParse(widget._controladorCampoNumeroConta.text);
    final double valor = double.tryParse(widget._controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    } else {
      showAlertDialog(context);
    }
  }
}

//Caixa de dialogo
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
