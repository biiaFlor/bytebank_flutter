import 'package:flutter/material.dart';
import '../Models/contact.dart';
import '../DataBase/app_database.dart';
import '../Componenets/CaixaDialogo.dart';

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Contato'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nome',
              ),
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _accountNumberController,
                decoration: InputDecoration(
                  labelText: 'Número da conta',
                ),
                style: TextStyle(
                  fontSize: 24.0,
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: RaisedButton(
                child: Text('Adicionar'),
                onPressed: () {
                  final String name = _nameController.text;
                  final int accountNumber =
                      int.tryParse(_accountNumberController.text);
                  final Contact newContact = Contact(0, name, accountNumber);

                  if (newContact.name != "" &&
                      newContact.accountNumber != null) {
                    save(newContact).then((id) => Navigator.pop(context));
                  } else {
                    showAlertDialog(context);
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
