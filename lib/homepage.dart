import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<homepage> {
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
          //scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 const Text('Em alta',
                style: TextStyle(fontSize: 25)),
                const SizedBox(
                  height: 15,
                ),
                 EmAlta(),
                 const SizedBox(
                  height: 100,
                 ),
                 const Text('Melhores Avaliações',
                 style: TextStyle(fontSize: 25)),
                 const SizedBox(
                  height: 15,
                 ),
                 MAvaliacao(),
                 const SizedBox(
                  height: 60,
                 ),
                 const Row(
                   children: [
                     Text('Melhores Avaliações',
                     style: TextStyle(fontSize: 25)),
                     SizedBox(width: 5),
                     Text('Animes',
                     style: TextStyle(fontSize: 25,
                     fontWeight: FontWeight.bold))
                   ],
                 ),
                 const SizedBox(height: 15),
                 MAvaliacaoAnime(),
                 const SizedBox(
                  height: 60,
                 ),
                 const Row(
                   children: [
                     Text('Melhores Avaliações',
                     style: TextStyle(fontSize: 25)),
                     SizedBox(width: 5),
                     Text('Filmes',
                     style: TextStyle(fontSize: 25,
                     fontWeight: FontWeight.bold))
                   ],
                 ),
                 const SizedBox(height: 15),
                 MAvaliacaoFilme(),
                 const SizedBox(
                  height: 60,
                 ),
                 const Row(
                   children: [
                     Text('Melhores Avaliações',
                     style: TextStyle(fontSize: 25)),
                     SizedBox(width: 5),
                     Text('Séries',
                     style: TextStyle(fontSize: 25,
                     fontWeight: FontWeight.bold))
                   ],
                 ),
                 const SizedBox(height: 15),
                 MAvaliacaoSeries()
              ],
            ),
          ),
        ),
      );
  }
}

class EmAlta extends StatelessWidget  {
  final List<String> Alta =[
    'Séries/Suits.jpg',
    'Animes/BlackCat.jpg',
    'Animes/BlueLock.jpg',
    'Filmes/MulherRei.jpg',
    'Filmes/CidadedeDeus.jpg',
  ];

  EmAlta({super.key});

   @override
  Widget build(BuildContext context){
    return
     CarouselSlider.builder(
        itemCount: Alta.length,
        options: CarouselOptions(
          height: 300,
          autoPlay: true,
          viewportFraction: 0.55,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: const Duration(seconds: 1),
          enlargeCenterPage: true,
          pauseAutoPlayOnTouch: true,
        ), 
        itemBuilder: (context, int index, int realIndex) {
          final path = Alta[index];
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              //height: 300,
              //width: 200,
              color: Colors.amber,
              child: GestureDetector(
                onTap: () {
                  switch (path){
                    case 'Séries/Suits.jpg':
                    Navigator.pushNamed(context, 'SuitsScreen');
                    break;

                    case 'Animes/BlackCat.jpg':
                    Navigator.pushNamed(context, 'BlackCatScreen');
                    break;

                    case 'Animes/BlueLock.jpg':
                    Navigator.pushNamed(context, 'BlueLockScreen');
                    break;

                    case 'Filmes/MulherRei.jpg':
                    Navigator.pushNamed(context, 'MulherReiScreen');
                    break;

                    case 'Filmes/CidadedeDeus.jpg':
                    Navigator.pushNamed(context, 'CidadedeDeusScreen');
                  }
                },
                child: Image.asset(
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fill,
                  path
                  ),
              ),
            ),
          );
        },  
    );
  }
}

class MAvaliacao extends StatelessWidget {
  final List<String> mAvc = [
    'Séries/BetterCallSaul.jpg',
    'Séries/Suits.jpg',
    'Filmes/PsicopataAmericano.jpg',
    'Filmes/ClubedaLuta.jpg',
    'Animes/BlueLock.jpg',
  ];

   MAvaliacao({super.key});

  @override
  Widget build(BuildContext context){
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: mAvc.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder:(context, index) {
        final path = mAvc[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            // ignore: sized_box_for_whitespace
            child: Container(
              height: 200,
              width: 200,
              //color: Colors.amber,
              child: GestureDetector(
                onTap: () {
                  switch (path) {
                    case 'Séries/BetterCallSaul.jpg':
                    Navigator.pushNamed(context, 'BetterCallScreen');
                    break;
                    
                    case 'Séries/Suits.jpg':
                    Navigator.pushNamed(context, 'SuitsScreen');
                    
                    case 'Filmes/PsicopataAmericano.jpg':
                    Navigator.pushNamed(context, 'PsicoAmericanoScreen');
                    break;
                    
                    case 'Filmes/ClubedaLuta.jpg':
                    Navigator.pushNamed(context, 'ClubedaLutaScreen');
                    break;
                    
                    case 'Animes/BlueLock.jpg':
                    Navigator.pushNamed(context, 'BlueLockScreen');
                    break;
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.fill,
                    path,
                    ),
                ),
              ),
            ),
          ),
        );
      }),
    );
    
  }
}

class MAvaliacaoAnime extends StatelessWidget {
  final List<String> mAvcAnime = [
    'Animes/AttackonTitan.jpg',
    'Animes/BlackCat.jpg',
    'Animes/BlueLock.jpg',
    'Animes/DemonSlayer.jpg',
    'Animes/Inuyasha.jpg',
  ];

   MAvaliacaoAnime({super.key});

  @override
  Widget build(BuildContext context){
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: mAvcAnime.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder:(context, index) {
        final path = mAvcAnime[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            // ignore: sized_box_for_whitespace
            child: Container(
              height: 200,
              width: 200,
              //color: Colors.amber,
              child: GestureDetector(
                onTap: () {
                  switch (path) {
                    case 'Animes/AttackonTitan.jpg':
                    Navigator.pushNamed(context, 'AttackonTitanScreen');
                    break;
                    
                    case 'Animes/BlackCat.jpg':
                    Navigator.pushNamed(context, 'BlackCatScreen');
                    
                    case 'Animes/BlueLock.jpg':
                    Navigator.pushNamed(context, 'BlueLockScreen');
                    break;
                    
                    case 'Animes/DemonSlayer.jpg':
                    Navigator.pushNamed(context, 'DemonSlayerScreen');
                    break;
                    
                    case 'Animes/Inuyasha.jpg':
                    Navigator.pushNamed(context, 'InuyashaScreen');
                    break;
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.fill,
                    path,
                    ),
                ),
              ),
            ),
          ),
        );
      }),
    );
    
  }
}

class MAvaliacaoFilme extends StatelessWidget {
  final List<String> mAvcFilme = [
    'Filmes/CidadedeDeus.jpg',
    'Filmes/ClubedaLuta.jpg',
    'Filmes/GarotaExemplar.jpg',
    'Filmes/GenioIndomavel.jpg',
    'Filmes/MulherRei.jpg',
  ];

   MAvaliacaoFilme({super.key});

  @override
  Widget build(BuildContext context){
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: mAvcFilme.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder:(context, index) {
        final path = mAvcFilme[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            // ignore: sized_box_for_whitespace
            child: Container(
              height: 200,
              width: 200,
              //color: Colors.amber,
              child: GestureDetector(
                onTap: () {
                  switch (path) {
                    case 'Filmes/CidadedeDeus.jpg':
                    Navigator.pushNamed(context, 'CidadedeDeusScreen');
                    break;
                    
                    case 'Filmes/ClubedaLuta.jpg':
                    Navigator.pushNamed(context, 'ClubedaLutaScreen');
                    
                    case 'Filmes/GarotaExemplar.jpg':
                    Navigator.pushNamed(context, 'GarotaExemplarScreen');
                    break;
                    
                    case 'Filmes/GenioIndomavel.jpg':
                    Navigator.pushNamed(context, 'GenioIndomavelScreen');
                    break;
                    
                    case 'Filmes/MulherRei.jpg':
                    Navigator.pushNamed(context, 'MulherReiScreen');
                    break;
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.fill,
                    path,
                    ),
                ),
              ),
            ),
          ),
        );
      }),
    );
    
  }
}

class MAvaliacaoSeries extends StatelessWidget {
  final List<String> mAvcSeries = [
    'Séries/BetterCallSaul.jpg',
    'Séries/BlackMirror.jpg',
    'Séries/BreakingBad.jpg',
    'Séries/DesignatedSurvivor.jpg',
    'Séries/Suits.jpg',
  ];

   MAvaliacaoSeries({super.key});

  @override
  Widget build(BuildContext context){
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: mAvcSeries.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder:(context, index) {
        final path = mAvcSeries[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            // ignore: sized_box_for_whitespace
            child: Container(
              height: 200,
              width: 200,
              //color: Colors.amber,
              child: GestureDetector(
                onTap: () {
                  switch (path) {
                    case 'Séries/BetterCallSaul.jpg':
                    Navigator.pushNamed(context, 'BetterCallScreen');
                    break;
                    
                    case 'Séries/BlackMirror.jpg':
                    Navigator.pushNamed(context, 'BlackMirrorScreen');
                    
                    case 'Séries/BreakingBad.jpg':
                    Navigator.pushNamed(context, 'BreakingBadScreen');
                    break;
                    
                    case 'Séries/DesignatedSurvivor.jpg':
                    Navigator.pushNamed(context, 'DesignatedSurvivorScreen');
                    break;
                    
                    case 'Séries/Suits.jpg':
                    Navigator.pushNamed(context, 'SuitsScreen');
                    break;
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.fill,
                    path,
                    ),
                ),
              ),
            ),
          ),
        );
      }),
    );
    
  }
}