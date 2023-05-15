import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teste/screens/home.dart'; // Criamos uma novo arquivo dart e importamos no main


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget { //Fazemos um Statless (fixo)
  const MyApp({Key? key}) : super(key:key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp( //Retornamos um materialApp
      title: 'To do List',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: Home(), //Chamamos nosso outro arquivo
    );
  }
}


