import 'package:flutter/material.dart';
import 'package:parcial3/paginas/home.dart';

void main() {
  runApp(const Api());
}

class Api extends StatelessWidget {
  const Api({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}