import 'package:flutter/material.dart';
import 'package:it_support/screens/configurations/configurations.dart';
import 'package:it_support/screens/home/home.dart';
import 'package:it_support/screens/new_ticket/new_ticket.dart';
import 'package:it_support/theme.dart';

//Este é o ponto de entrada do aplicativo. Ele configura as rotas e o tema do aplicativo.
void main() {
  runApp(
    MaterialApp(
      // Define a rota inicial do aplicativo como 'home'.
      initialRoute: 'home',
      // Mapeia as rotas para as telas correspondentes.
      routes: {
        'home': (context) => const Home(),
        'new_ticket': (context) => const NewTicket(),
        'configurations': (context) => Configurations(),
      },
      // Remove o banner de depuração.
      debugShowCheckedModeBanner: false,
      // Define o tema claro.
      theme: ThemeData(
        colorScheme: MaterialTheme.lightScheme(),
      ),
      // Define o tema escuro.
      darkTheme: ThemeData(
        colorScheme: MaterialTheme.darkScheme(),
      ),
    ),
  );
}
