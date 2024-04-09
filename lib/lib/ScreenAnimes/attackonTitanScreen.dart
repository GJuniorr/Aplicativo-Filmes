import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class attackontitanscreen extends StatefulWidget {
  const attackontitanscreen({super.key});

  @override
  State<attackontitanscreen> createState() => _attackontitanscreenState();
}

class _attackontitanscreenState extends State<attackontitanscreen> {
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
                child: Image.asset('Animes/AttackonTitan.jpg'),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 40),
                  child: Text('Eren Jaeger jurou eliminar todos os Titãs, \nmas em uma batalha desesperada ele se torna aquilo\n que mais odeia.',
                  textAlign: TextAlign.center,),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Text(' Com seus novos poderes, ele luta pela liberdade\n da humanidade,\n combatendo os monstros que ameaçam seu lar. ',
                  textAlign: TextAlign.center,),
                ),
                 const Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Text(' Mesmo depois de derrotar a Titã Fêmea, \nEren não consegue descansar\n  uma horda de Titãs se aproximam \nda Muralha Rose e a batalha\n em nome da humanidade continua! ',
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