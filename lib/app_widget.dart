import 'package:filmes/Menu/avaliacoes.dart';
import 'package:filmes/Menu/filmes.dart';
import 'package:filmes/Menu/lista.dart';
import 'package:filmes/Menu/series.dart';
import 'package:filmes/login/login.dart';
import 'package:filmes/homepage.dart';
import 'package:filmes/Menu/animes.dart';
import 'package:flutter/material.dart';

class app_widget extends StatefulWidget {
  const app_widget({super.key});

  @override
  State<app_widget> createState() => _app_widgetState();
}

class _app_widgetState extends State<app_widget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData.dark(),
      initialRoute: 'series',
      routes:{
        'login':(context) => const login(),
        'homepage':(context) => const homepage(),
        'animes':(context) => const animes(),
        'filmes':(context) => const filmes(),
        'series':(context) => const series(),
        'lista':(context) => const lista(),
        'avaliacoes':(context) => const avaliacoes(),
      }
    );
  }
}