import 'package:flutter/material.dart';
import 'package:it_support/screens/configurations/configurations.dart';
import 'package:it_support/screens/home/home.dart';
import 'package:it_support/screens/new_ticket/new_ticket.dart';
import 'package:it_support/theme.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: 'home',
      routes: {
        'home': (context) => const Home(),
        'new_ticket': (context) => const NewTicket(),
        'configurations': (context) => Configurations(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: MaterialTheme.lightScheme(),
      ),
      darkTheme: ThemeData(
        colorScheme: MaterialTheme.darkScheme(),
      ),
    ),
  );
}
