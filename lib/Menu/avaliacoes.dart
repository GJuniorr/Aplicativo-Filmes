

import 'package:filmes/Menu/series.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class avaliacoes extends StatefulWidget {
  
  const avaliacoes({super.key});

  @override
  State<avaliacoes> createState() => _avaliacoesState();
}

class _avaliacoesState extends State<avaliacoes> {
  List<bool> markedStar = [];

  @override
  void initState() {
    super.initState();
    // Recuperar os valores salvos na tela "Animes"
    _getSavedValues();
  }

  Future<void> _getSavedValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String>? markedStarSIndexes = prefs.getStringList('marked_starS_indexes');
    if (markedStarSIndexes != null) {
      markedStar = List.generate(10, (index) => markedStarSIndexes.contains(index.toString()));
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
     List<int> markedStarIndices = [];
    for (int i = 0; i < markedStar.length; i++) {
      if (markedStar[i]) {
        markedStarIndices.add(i);
      }
    }
    return  Scaffold(
      drawer:  Drawer(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: ListTile(
                leading: const Icon(Icons.stars),
                title: const Text('Minhas avaliações'),
                onTap: () {
                  Navigator.pushNamed(context, 'avaliacoes');
                },
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.purple,
        actions: [
          TextButton(onPressed: () {
            Navigator.pushNamed(context, 'homepage');
          }, child: const Text(
            'Início',
            style: TextStyle(color: Colors.white,
            fontSize: 15)
            )
            ),
          TextButton(onPressed: () {
            Navigator.pushNamed(context, 'animes');
          }, child: const Text(
            'Animes',
            style: TextStyle(color: Colors.white,
            fontSize: 15)
            )
            ),
            TextButton(onPressed: () {
            Navigator.pushNamed(context, 'filmes');
          }, child: const Text(
            'Filmes',
            style: TextStyle(color: Colors.white,
            fontSize: 15)
            )
            ),
            TextButton(onPressed: () {
            Navigator.pushNamed(context, 'series');
          }, child: const Text(
            'Séries',
            style: TextStyle(color: Colors.white,
            fontSize: 15)
            )
            ),
            TextButton(onPressed: () {
            Navigator.pushNamed(context, 'lista');
          }, child: const Text(
            'Minha lista',
            style: TextStyle(color: Colors.white,
            fontSize: 15)
            )
            ),
        ]),
        body:   SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Column(
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: SizedBox(
                        height: 222,
                        width: 201,
                        child: Column(
                          children: [
                             Padding(
                          padding: const EdgeInsets.only(left: 12.0, top: 20.0),
                          child: Image.asset('Animes/AttackonTitan.jpg'),
                        ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ), ),
          
        ),
    );
  }
}