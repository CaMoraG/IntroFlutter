import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/juegoNumero.dart';
import 'package:untitled/segundaPantalla.dart';
import 'State.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => GameState(),
      child: const MyApp(),
    )
  );
}
