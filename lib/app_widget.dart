import 'package:filmes/Menu/avaliacoes.dart';
import 'package:filmes/Menu/filmes.dart';
import 'package:filmes/Menu/lista.dart';
import 'package:filmes/Menu/series.dart';
import 'package:filmes/ScreenAnimes/AttackonTitanScreen.dart';
import 'package:filmes/ScreenAnimes/berserkerScreen.dart';
import 'package:filmes/ScreenAnimes/blackCatScreen.dart';
import 'package:filmes/ScreenAnimes/blueLockScreen.dart';
import 'package:filmes/ScreenAnimes/cdzLostCanvasScreen.dart';
import 'package:filmes/ScreenAnimes/cdzOmegaScreen.dart';
import 'package:filmes/ScreenAnimes/cdzScreen.dart';
import 'package:filmes/ScreenAnimes/demonSlayerScreen.dart';
import 'package:filmes/ScreenAnimes/inuyashaScreen.dart';
import 'package:filmes/ScreenAnimes/narutoScreen.dart';
import 'package:filmes/ScreenFilmes/cidadedeDeusScreen.dart';
import 'package:filmes/ScreenFilmes/clubedaLutaScreen.dart';
import 'package:filmes/ScreenFilmes/garotaExemplarScreen.dart';
import 'package:filmes/ScreenFilmes/genioIndomavelScreen.dart';
import 'package:filmes/ScreenFilmes/gigantesdeAcoScreen.dart';
import 'package:filmes/ScreenFilmes/mulherReiScreen.dart';
import 'package:filmes/ScreenFilmes/psicopataScreen.dart';
import 'package:filmes/ScreenFilmes/questaodeTempoScreen.dart';
import 'package:filmes/ScreenFilmes/simplesmenteScreen.dart';
import 'package:filmes/ScreenFilmes/tropadeEliteScreen.dart';
import 'package:filmes/ScreenSeries/betterCallSaulScreen.dart';
import 'package:filmes/ScreenSeries/blackMirrorScreen.dart';
import 'package:filmes/ScreenSeries/breakingBadScreen.dart';
import 'package:filmes/ScreenSeries/designatedSurvivorScreen.dart';
import 'package:filmes/ScreenSeries/narcosScreen.dart';
import 'package:filmes/ScreenSeries/sintoniaScreen.dart';
import 'package:filmes/ScreenSeries/suitsScreen.dart';
import 'package:filmes/ScreenSeries/supernaturalScreen.dart';
import 'package:filmes/ScreenSeries/vikingsScreen.dart';
import 'package:filmes/ScreenSeries/youScreen.dart';
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
      initialRoute: 'homepage',
      routes:{
        'login':(context) => const login(),
        'homepage':(context) => const homepage(),
        'animes':(context) => const animes(),
        'filmes':(context) => const filmes(),
        'series':(context) => const series(),
        'lista':(context) => const lista(),
        'avaliacoes':(context) => const avaliacoes(),
        //AnimesScreen//
        'attackScreen':(context) => const attackontitanscreen(),
        'berserkerScreen':(context) => const berserkerScreen(),
        'blackCatScreen':(context) => const BlackCatScreen(),
        'blueLockScreen':(context) => const blueLockScreen(),
        'cdzScreen':(context) => const cdzScreen(),
        'cdzOmegaScreen':(context) => const cdzOmegaScreen(),
        'cdzLostCanvasScreen':(context) => const cdzLostCanvas(),
        'demonSlayerScreen':(context) => const demonSlayerScreen(),
        'inuyashaScreen':(context) => const inuyashaScreen(),
        'narutoScreen':(context) => const narutoScreen(),
        //FilmesScreen//
        'cidadedeDeusScreen':(context) => const cidadedeDeusScreen(),
        'clubedaLutaScreen':(context) => const clubedalutaScreen(),
        'garotaExemplarScreen':(context) => const garotaExemplarScreen(),
        'genioIndomavelScreen':(context) => const genioIndomavelScreen(),
        'gigantesdeAcoScreen':(context) => const gigantesdeAcoScreen(),
        'mulherReiScreen':(context) => const mulherReiScreen(),
        'psicopataScreen':(context) => const psicopataScreen(),
        'questaodeTempoScreen':(context) => const questaodeTempoScreen(),
        'simplesmenteScreen':(context) => const simplesmenteScreen(),
        'tropadeEliteScreen':(context) => const tropadeEliteScreen(),
        //SériesScreen//
        'betterCallSaulScreen':(context) => const betterCallSaulScreen(),
        'blackMirrorScreen':(context) => const blackMirrorScreen(),
        'breakingBadScreen':(context) => const breakingBadScreen(),
        'designatedSurvivorScreen':(context) => const designatedSurvivorScreen(),
        'narcosScreen':(context) => const narcosScreen(),
        'sintoniaScreen':(context) => const sintoniaScreen(),
        'suitsScreen':(context) => const suitsScreen(),
        'supernaturalScreen':(context) => const supernaturalScreen(),
        'vikingsScreen':(context) => const vikingsScreen(),
        'youScreen':(context) => const youScreen(),
      }
    );
  }
}