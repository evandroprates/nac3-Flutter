import 'package:flutter/material.dart';
import 'package:flutter_nac3_rm82381/views/selecoes-view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       title: 'Nac 3 - Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SelecaoView(),
      debugShowCheckedModeBanner: false,
    );
  }
}

