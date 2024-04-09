import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class blueLockScreen extends StatefulWidget {
  const blueLockScreen({super.key});

  @override
  State<blueLockScreen> createState() => _blueLockScreenState();
}

class _blueLockScreenState extends State<blueLockScreen> {
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
                child: Image.asset('Animes/BlueLock.jpg'),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 40),
                  child: Text('Após sofrer um vexame na Copa do Mundo de 2018,\n a seleção japonesa sofre para se recompor.\n Falta ao time um artilheiro,\n uma estrela capaz de guiá-los à vitória. ',
                  textAlign: TextAlign.center,),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Text('Com o intuito de criar um atacante\n com fome de bola e sede de vitória,\n capaz de virar jogos tidos como impossíveis,\n a Confederação Japonesa de Futebol\n reune 300 dos melhores jogadores\n de base do país em um só lugar.',
                  textAlign: TextAlign.center,),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Text('Centenas de jovens vão se enfrentar\n numa batalha de músculos e de egos\n para provar que são os melhores.',
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