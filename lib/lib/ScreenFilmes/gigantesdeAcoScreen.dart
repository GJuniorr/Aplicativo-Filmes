import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class gigantesdeAcoScreen extends StatefulWidget {
  const gigantesdeAcoScreen({super.key});

  @override
  State<gigantesdeAcoScreen> createState() => _gigantesdeAcoScreenState();
}

class _gigantesdeAcoScreenState extends State<gigantesdeAcoScreen> {
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
                child: Image.asset('Filmes/GigantesdeAco.jpg'),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 40),
                  child: Text('Em um futuro próximo,\n as máquinas substituem os homens no ringue.\n As lutas de boxe acontecem entre\n robôs de alta tecnologia. Charlie,\n um ex-lutador frustrado,\n decide se juntar ao filho\n para construir um competidor imbatível.',
                  textAlign: TextAlign.center,),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 40),
                  child: Text('Onde assistir: Netflix',
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