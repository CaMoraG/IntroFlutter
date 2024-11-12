import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';

class MyGame extends StatelessWidget{
  const MyGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Juego de Números',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const GamePage(title: 'Juego de Números'),
    );
  }
}

class GamePage extends StatefulWidget {
  const GamePage({super.key, required this.title});

  final String title;

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late int _secretNumber;
  static const int _minNumber = 0;
  static const int _maxNumber = 50;
  String mensaje = "";
  int intentos = 0;

  void _onPlay(){
    setState(() {
      if (controller.text.isNotEmpty){
        final int number = int.parse(controller.text);
        if (number == _secretNumber){
          mensaje = "¡Felicidades! Has adivinado el número secreto en $intentos intentos";
        } else if (number < _secretNumber){
          mensaje = "El número secreto es mayor";
        } else {
          mensaje = "El número secreto es menor";
        }
        intentos++;
      }
    });
  }

  late TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController();
    _secretNumber = (_minNumber + (math.Random().nextInt(_maxNumber - _minNumber + 1)));
    log("Número secreto: $_secretNumber");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset(
                "images/imagen1.jpg"
              ),
            ),
            const Text(
              "Ingresa un número entre $_minNumber y $_maxNumber:",
            ),
            TextField(
              controller: this.controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: "Numero...",),
            ),
            ElevatedButton(
              onPressed: _onPlay,
              child: const Text("Verificar"),
            ),
            Text (
              "Mensaje: $mensaje",
            ),
            Text(
              "Número de intentos: $intentos",
            ),
          ],
        ),
      ),
    );
  }
}