import 'package:flutter/material.dart';
import 'WebAPI/WebClient.dart';
import 'Screens/Dashboard.dart';

void main() {
  runApp(BytebankApp());
  findAll();
}

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Dashboard(),
    );
  }
}
