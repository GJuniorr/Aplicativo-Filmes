import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class cdzLostCanvas extends StatefulWidget {
  const cdzLostCanvas({super.key});

  @override
  State<cdzLostCanvas> createState() => _cdzLostCanvasState();
}

class _cdzLostCanvasState extends State<cdzLostCanvas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                Padding(padding: const EdgeInsets.only(left: 40, top: 20),
                child: Image.asset('Animes/CavaleirodosZodiacosTheLostCanvas.jpg'),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 40),
                  child: Text('A "Guerra Santa", uma batalha travada entre\n a Deusa Athena e o Rei do Submundo Hades,\n tem ocorrido desde a era das lendas.\n Esta história se passa no século 18\n  muito antes da era de "Saint Seiya."\n É uma nova história envolvendo os Santos Pégaso,\n o Rei Hades do Submundo e a Deusa Atena!\n Quando Hades termina sua pintura\n gigante que cobre o céu,\n "The Lost Canvas",\n diz-se que todas as vidas na Terra serão perdidas.\n Tenma, que se tornou um santo Pegasus,\n deseja parar seu melhor amigo Sozinho,\n que foi escolhido para se tornar um navio para Hades.\n Cuidado com ele enquanto\n ele se dirige para o castelo de Hades!',
                  textAlign: TextAlign.center,),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 40),
                  child: Text('Onde assistir: Crunchyroll',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 20),),
                ),
              ],
            ),
          ),
        ),
    );
  }
}