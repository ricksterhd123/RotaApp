import 'MainScreen.dart';
import 'package:flutter/material.dart';

class RotaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RotaApp',
      home: MainScreen(),
    );
  }
}

void main() => runApp(RotaApp());