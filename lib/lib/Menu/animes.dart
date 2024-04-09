import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class animes extends StatefulWidget {
  const animes({super.key});

  @override
  State<animes> createState() => _animesState();
}


class _animesState extends State<animes> {
late _ImgAvlAttState imgAvlAtt = _ImgAvlAttState();

final List<double> _ratingA = List.generate(10, (index) => 0.0);

List<bool> markedA = List.generate(10, (index) => false);

List<bool> markedStarA = List.generate(10, (index) => false);
List<bool> botaoStarA = List.generate(10, (index) => false);

final List<bool> avlA = List.generate(10, (index) => false);

@override
  void initState(){
    super.initState();
    loadBoolValueA();
    loadBoolValueStarA();
    loadRatingA();
    imgAvlAtt = _ImgAvlAttState();
  }
  void loadRatingA() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  setState(() {
    _ratingA[0] = prefs.getDouble('ratingA0') ?? 0.0;
    _ratingA[1] = prefs.getDouble('ratingA1') ?? 0.0;
    _ratingA[2] = prefs.getDouble('ratingA2') ?? 0.0;
    _ratingA[3] = prefs.getDouble('ratingA3') ?? 0.0;
    _ratingA[4] = prefs.getDouble('ratingA4') ?? 0.0;
    _ratingA[5] = prefs.getDouble('ratingA5') ?? 0.0;
    _ratingA[6] = prefs.getDouble('ratingA6') ?? 0.0;
    _ratingA[7] = prefs.getDouble('ratingA7') ?? 0.0;
    _ratingA[8] = prefs.getDouble('ratingA8') ?? 0.0;
    _ratingA[9] = prefs.getDouble('ratingA9') ?? 0.0;
    
    
  });
}

void _toogleMarkA(int index) {
    setState(() {
      markedA[index] = !markedA[index];
      saveBoolValueA();
      
    });
  }

  /*void _toogleMarkStarA(int index) {
    setState(() {
      markedStarA[index] = !markedStarA[index];
      saveBoolValueStarA();
    });
  }*/

  void _toogleMarkStarA(int index){
    setState(() {
      markedStarA[index] = !markedStarA[index];
      saveBoolValueStarA();
      if (markedStarA[index]) {
        avlA[index] = true;
        //_ImgAvlAttState().saveRatingA0(_ratingA[index]);
      } else {
        avlA[index] = false;
        _ratingA[index] = 0.0;
       // _ImgAvlAttState().saveRatingA0(_ratingA[index]);
      }
      //loadRatingA();
    });
  }

void saveBoolValueA() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> markedAIndexes = [];

    for (int i = 0; i < markedA.length; i++) {
      if (markedA[i]) {
        markedAIndexes.add(i.toString());
        
      }
    }
    prefs.setStringList('markedA_indexes', markedAIndexes);

    //prefs.setStringList('markedA_indexes', markedAIndexes);
  }

  void saveBoolValueStarA() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> markedStarAIndexes = [];
    
    for (int i = 0; i < markedStarA.length; i++) {
      if (markedStarA[i]) {
        markedStarAIndexes.add(i.toString());
        avlA[i] = true;
      }
    }
    prefs.setStringList('marked_starA_indexes', markedStarAIndexes);
  }


  void loadBoolValueA() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? markedAIndexes = prefs.getStringList('markedA_indexes');
    
    if (markedAIndexes != null) {
      setState(() {
        markedA = List.generate(10, (index) => markedAIndexes.contains(index.toString()));
      });
    }
    
  }

   void loadBoolValueStarA() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String>? markedStarAIndexes = prefs.getStringList('marked_starA_indexes');
    if (markedStarAIndexes != null) {
      setState(() {
        markedStarA = List.generate(10, (index) => markedStarAIndexes.contains(index.toString()));
        });
    }
  }


/*void updateRating(double newRating){
  setState(() {
    _rating = newRating;
  });
    //_rating = newRating;
}*/



  @override
  Widget build(BuildContext context) {
    double ratingAtt = imgAvlAtt._ratingAtt;
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
        body:SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Column(
                  children: [Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        // ignore: sized_box_for_whitespace
                        child: Container(
                          height: 224,
                          width: 225,
                          //color: Colors.amber,
                          child: 
                      Column(
                        children: [
                           Padding(
                            padding: const EdgeInsets.only(left: 12.0, top: 20.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, 'attackScreen');
                              },
                              child: Image.asset('Animes/AttackonTitan.jpg')),
                            
                          ),
                             Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                   IconButton(onPressed: () {
                                    _toogleMarkStarA(0);
                                    botaoStarA[0] = true;
                                    //const ImgAvlAtt();
                                  }, icon:  Icon(markedStarA[0] ? Icons.star_outlined : Icons.star_outline, color: Colors.yellow )),
                                const Text('Attack on Titan',
                                //style: TextStyle(fontSize: 15),
                                textAlign: TextAlign.center,),
                                IconButton(onPressed: () {
                                  _toogleMarkA(0);
                            },
                             icon: Icon(markedA[0] ?Icons.bookmark_added : Icons.bookmark_add_outlined,))
                              ],
                            ),
                             Visibility(
                              visible: markedStarA[0],
                               child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.star,
                                  color: Colors.yellow),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text('${_ratingA[0]}' ,
                                    //textAlign: TextAlign.center
                                    ),
                                  ),
                                ],
                                                         ),
                             )
                            //if (_isExpanded) const ExpandedContainer(),        
                        ],
                      ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        // ignore: sized_box_for_whitespace
                        child: Container(
                          height: 224,
                          width: 225,
                          //color: Colors.amber,
                          child: 
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0, top: 20.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, 'berserkerScreen');
                              },
                              child: Image.asset('Animes/Berserker.jpg')),
                          ),
                            Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(onPressed: () {
                                    _toogleMarkStarA(1);
                                    botaoStarA[1] = true;
                                  }, icon:  Icon(markedStarA[1] ?Icons.star_outlined : Icons.star_outline, color: Colors.yellow)),
                                const Text('Berserker',
                                //style: TextStyle(fontSize: 15),
                                textAlign: TextAlign.center,),
                              IconButton(onPressed: () {
                                _toogleMarkA(1);
                              }, icon: Icon(markedA[1] ?Icons.bookmark_added : Icons.bookmark_add_outlined))
                              ],
                          ),
                          Visibility(
                            visible: markedStarA[1],
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.star,
                                color: Colors.yellow),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: 
                                  Text('${_ratingA[1]}'),)
                              ],
                            ),
                          )
                        ],
                      ),
                      ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      if (avlA[0] && botaoStarA[0])
                      const ImgAvlAtt(),
                      if(avlA[1] && botaoStarA[1])
                      const ImgAvlBer(),
                       Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            // ignore: sized_box_for_whitespace
                            child: Container(
                              height: 224,
                              width: 225,
                              //color: Colors.amber,
                              child: 
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0, top: 20),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, 'blackCatScreen');
                                  },
                                  child: Image.asset('Animes/BlackCat.jpg')),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(onPressed: () {
                                        _toogleMarkStarA(2);
                                        botaoStarA[2] = true;
                                      }, icon:  Icon(markedStarA[2] ?Icons.star_outlined : Icons.star_outline, color: Colors.yellow)),
                                  const Text('Black Cat',
                                  //style: TextStyle(fontSize: 15),
                                  textAlign: TextAlign.center),
                                  IconButton(onPressed: () {
                                    _toogleMarkA(2);
                                  }, icon: Icon(markedA[2] ?Icons.bookmark_added : Icons.bookmark_add_outlined))
                                ],
                              ),
                              Visibility(
                                visible: markedStarA[2],
                                child: Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                const Icon(Icons.star,
                                color: Colors.yellow),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: 
                                  Text('${_ratingA[2]}'),)
                                                          ],
                                ),
                              )
                            ],
                          ),
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            // ignore: sized_box_for_whitespace
                            child: Container(
                              height: 224,
                              width: 225,
                              //color: Colors.amber,
                              child: 
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0, top: 20.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, 'blueLockScreen');
                                  },
                                  child: Image.asset('Animes/BlueLock.jpg')),
                              ),
                                Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                 IconButton(onPressed: () {
                                        _toogleMarkStarA(3);
                                        botaoStarA[3] = true;
                                      }, icon:  Icon(markedStarA[3] ?Icons.star_outlined : Icons.star_outline, color: Colors.yellow)),
                                    const Text('Blue Lock',
                                    //style: TextStyle(fontSize: 15),
                                    textAlign: TextAlign.center,),
                                  IconButton(onPressed: () {
                                    _toogleMarkA(3);
                                  }, icon: Icon(markedA[3] ?Icons.bookmark_added : Icons.bookmark_add_outlined))],
                              ),
                              Visibility(
                                visible: markedStarA[3],
                                child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.star,
                                  color: Colors.yellow),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text('${_ratingA[3]}' ,
                                    //textAlign: TextAlign.center
                                    ),
                                  ),
                                ],
                                ),
                              ),
                            ],
                          ),
                          ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          if(avlA[2] && botaoStarA[2])
                          const ImgAvlA2(),
                          if(avlA[3] && botaoStarA[3])
                          const ImgAvlA3(),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        // ignore: sized_box_for_whitespace
                        child: Container(
                          height: 224,
                          width: 225,
                          //color: Colors.amber,
                          child: 
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0, top: 20 ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, 'cdzScreen');
                              },
                              child: Image.asset('Animes/CavaleirodosZodiacos.jpg')),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(onPressed: () {
                                    _toogleMarkStarA(4);
                                    botaoStarA[4] = true;
                                  }, icon:  Icon(markedStarA[4] ?Icons.star_outlined : Icons.star_outline, color: Colors.yellow)),
                              const Text('Cavaleiro Dos Zodíacos',
                              style: TextStyle(fontSize: 11.7),
                              textAlign: TextAlign.center),
                              IconButton(onPressed: () {
                                _toogleMarkA(4);
                              }, icon: Icon(markedA[4] ? Icons.bookmark_added : Icons.bookmark_add_outlined))
                            ],
                          ),
                          Visibility(
                            visible: markedStarA[4],
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.star,
                                  color: Colors.yellow),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text('${_ratingA[4]}' ,
                                    //textAlign: TextAlign.center
                                    ),
                                  ),
                                ],
                                ),
                          ),
                        ],
                      ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        // ignore: sized_box_for_whitespace
                        child: Container(
                          height: 224,
                          width: 225,
                          //color: Colors.amber,
                          child: 
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0, top: 20 ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, 'cdzOmegaScreen');
                              },
                              child: Image.asset('Animes/CavaleirodosZodiacosOmega.jpg')),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(onPressed: () {
                                    _toogleMarkStarA(5);
                                    botaoStarA[5] = true;
                                  }, icon:  Icon(markedStarA[5] ?Icons.star_outlined : Icons.star_outline, color: Colors.yellow)),
                              const Text('CDZ Ômega',
                              textAlign: TextAlign.center),
                              IconButton(onPressed: () {
                                _toogleMarkA(5);
                                botaoStarA[5] = true;
                              }, icon: Icon(markedA[5] ? Icons.bookmark_added : Icons.bookmark_add_outlined))
                            ],
                          ),
                          Visibility(
                            visible: markedStarA[5],
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.star,
                                  color: Colors.yellow),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text('${_ratingA[5]}' ,
                                    //textAlign: TextAlign.center
                                    ),
                                  ),
                                ],
                                ),
                          ),
                        ],
                      ),
                        ),
                      ),
                  ],
                ),
                Column(
                  children: [
                    if(avlA[4] && botaoStarA[4])
                    const ImgAvlA4(),
                    if(avlA[5] && botaoStarA[5])
                    const ImgAvlA5(),
                  ],
                ),
                 Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        // ignore: sized_box_for_whitespace
                        child: Container(
                          height: 224,
                          width: 225,
                          //color: Colors.amber,
                          child: 
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0, top: 20 ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, 'cdzLostCanvasScreen');
                              },
                              child: Image.asset('Animes/CavaleirodosZodiacosTheLostCanvas.jpg')),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(onPressed: () {
                                    _toogleMarkStarA(6);
                                    botaoStarA[6] = true;
                                  }, icon:  Icon(markedStarA[6] ?Icons.star_outlined : Icons.star_outline, color: Colors.yellow)),
                              const Text('Lost Canvas',
                              textAlign: TextAlign.center),
                              IconButton(onPressed: () {
                                _toogleMarkA(6);
                              }, icon: Icon(markedA[6] ? Icons.bookmark_added : Icons.bookmark_add_outlined))
                            ],
                          ),
                          Visibility(
                            visible: markedStarA[6],
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.star,
                                  color: Colors.yellow),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text('${_ratingA[6]}' ,
                                    //textAlign: TextAlign.center
                                    ),
                                  ),
                                ],
                                ),
                          ),
                        ],
                      ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        // ignore: sized_box_for_whitespace
                        child: Container(
                          height: 224,
                          width: 225,
                          //color: Colors.amber,
                          child: 
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0, top: 20 ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, 'demonSlayerScreen');
                              },
                              child: Image.asset('Animes/DemonSlayer.jpg')),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(onPressed: () {
                                    _toogleMarkStarA(7);
                                    botaoStarA[7] = true;
                                  }, icon:  Icon(markedStarA[7] ?Icons.star_outlined : Icons.star_outline, color: Colors.yellow)),
                              const Text('Demon Slayer',
                              textAlign: TextAlign.center),
                              IconButton(onPressed: () {
                                _toogleMarkA(7);
                              }, icon: Icon(markedA[7] ? Icons.bookmark_added : Icons.bookmark_add_outlined))
                            ],
                          ),
                          Visibility(
                            visible: markedStarA[7],
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.star,
                                  color: Colors.yellow),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text('${_ratingA[7]}' ,
                                    //textAlign: TextAlign.center
                                    ),
                                  ),
                                ],
                                ),
                          ),
                        ],
                      ),
                        ),
                      ),
                  ],
                ),
                Column(
                  children: [
                    if(avlA[6] && botaoStarA[6])
                    const ImgAvlA6(),
                    if(avlA[7] && botaoStarA[7])
                    const ImgAvlA7(),
                    if(avlA[8] && botaoStarA[8])
                    const ImgAvlA8(),
                    if(avlA[9] && botaoStarA[9])
                    const ImgAvlA9(),
                  ],
                ),
                Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        // ignore: sized_box_for_whitespace
                        child: Container(
                          height: 224,
                          width: 225,
                          //color: Colors.amber,
                          child: 
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0, top: 20 ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, 'inuyashaScreen');
                              },
                              child: Image.asset('Animes/Inuyasha.jpg')),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(onPressed: () {
                                    _toogleMarkStarA(8);
                                    botaoStarA[8] = true;
                                  }, icon:  Icon(markedStarA[8] ?Icons.star_outlined : Icons.star_outline, color: Colors.yellow)),
                              const Text('Inuyasha',
                              textAlign: TextAlign.center),
                              IconButton(onPressed: () {
                                _toogleMarkA(8);
                              }, icon: Icon(markedA[8] ? Icons.bookmark_added : Icons.bookmark_add_outlined))
                            ],
                          ),
                          Visibility(
                            visible: markedStarA[8],
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.star,
                                  color: Colors.yellow),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text('${_ratingA[8]}' ,
                                    //textAlign: TextAlign.center
                                    ),
                                  ),
                                ],
                                ),
                          ),
                        ],
                      ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        // ignore: sized_box_for_whitespace
                        child: Container(
                          height: 224,
                          width: 225,
                          //color: Colors.amber,
                          child: 
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0, top: 20 ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, 'narutoScreen');
                              },
                              child: Image.asset('Animes/Naruto.jpg')),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                             IconButton(onPressed: () {
                                    _toogleMarkStarA(9);
                                    botaoStarA[9] = true;
                                  }, icon:  Icon(markedStarA[9] ?Icons.star_outlined : Icons.star_outline, color: Colors.yellow)),
                              const Text('Naruto',
                              textAlign: TextAlign.center),
                              IconButton(onPressed: () {
                                _toogleMarkA(9);
                              }, icon: Icon(markedA[9] ? Icons.bookmark_added : Icons.bookmark_add_outlined))
                            ],
                          ),
                          Visibility(
                            visible: markedStarA[9],
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.star,
                                  color: Colors.yellow),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text('${_ratingA[9]}' ,
                                    //textAlign: TextAlign.center
                                    ),
                                  ),
                                ],
                                ),
                          ),
                        ],
                      ),
                        ),
                      ),
                  ],
                ),
                  ],
                ),
              ),
          ),
        ),
    );
  }
}


class ImgAvlAtt extends StatefulWidget {
  
   const ImgAvlAtt({super.key});

  @override
  State<ImgAvlAtt> createState() => _ImgAvlAttState();
}


class _ImgAvlAttState extends State<ImgAvlAtt> {
late _animesState animess_ = _animesState();

@override
  void initState() {
    super.initState();
    animess_ = _animesState();
  }

//late List animess_;[0]._ratingA;
String avlf = '';
bool isvisible = true;
List<bool> isSelected = List.generate(10, (index) => false);
late double _ratingAtt = 0.0;
late double _teste = 0.0;


void saveRatingA0(double ratingA0) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setDouble('ratingA0', ratingA0);
  print('Valor salvo $ratingA0');
}


  @override
  Widget build(BuildContext context) {
    List<double> ratingA = animess_._ratingA;
    return Visibility(
      visible: isvisible,
      child: Container(
        alignment: Alignment.bottomCenter,
        color: Colors.black45,
        height: 224,
        width: 400,
        child: Center(
          child: Column(
            children: [
                Text('Sua Avaliação (De 1 a 10) Avaliação = $_ratingAtt',
              style: const TextStyle(color: Colors.blue),),
              const SizedBox(
                height: 5,
              ),
              const Text('Attack on Titan'),
              const SizedBox(
                height: 5,
              ),
              const Text('Avaliação só atualizará quando trocar de tela',
              style: TextStyle(color: Colors.green),),
              const SizedBox(
                height: 5,
              ),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 0,
                children: List.generate(
                  10,
                  (index) => 
                         IconButton(
                        onPressed: () {
                          setState(() {
                        _ratingAtt = index + 1;
                        _teste = _ratingAtt;
                        ratingA[0] = index + 1;
                       for (int i = 0; i < isSelected.length; i++) {
                              isSelected[i] = i <= index;
                            }
                          });
                        },
                        icon:  Icon(
                          isSelected[index]
                          ? Icons.star
                          : Icons.star_border,
                      color: isSelected[index] ? Colors.yellow : null,),
                      ),
                     ),
                  ),
              const SizedBox(
                height: 5,
              ),
              TextButton(
                style: const ButtonStyle(
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                  backgroundColor: MaterialStatePropertyAll(Colors.blue),
                  shape: MaterialStatePropertyAll(LinearBorder()),
                  minimumSize: MaterialStatePropertyAll(Size(5, 5))),
                onPressed: () {
                  saveRatingA0(_ratingAtt);
                  setState(() {
                    _ratingAtt = _ratingAtt;
                    isvisible = false;
                  });
              }, child:  const Text('Avaliar'))
            ],
          ),
        ),
      ),
    );
  }
}


class ImgAvlBer extends StatefulWidget {
  
  const ImgAvlBer({super.key});

  @override
  State<ImgAvlBer> createState() => _ImgAvlBerState();
}

class _ImgAvlBerState extends State<ImgAvlBer> {
String avlfBer = '';
bool isvisibleBer = true;
List<bool> isSelectedBer = List.generate(10, (index) => false);
late double _ratingBer = 0.0;


/*void setRatingBer(double newRatingBer){
  setState(() {
    _ratingBer = newRatingBer;
  });
  _animesState().updateRatingBer(newRatingBer);
}*/

void saveRatingA1(double ratingA1) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setDouble('ratingA1', ratingA1);
}
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isvisibleBer,
      child: Container(
        alignment: Alignment.bottomCenter,
        color: Colors.black45,
        height: 224,
        width: 400,
        child: Center(
          child: Column(
            children: [
                Text('Sua Avaliação (De 1 a 10) Avaliação = $_ratingBer',
              style: const TextStyle(color: Colors.blue),),
              const SizedBox(
                height: 5,
              ),
              const Text('Berserker'),
              const SizedBox(
                height: 5,
              ),
              const Text('Avaliação só atualizará quando trocar de tela',
              style: TextStyle(color: Colors.green),),
              const SizedBox(
                height: 5,
              ),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 0,
                children: List.generate(
                  10,
                  (index) => 
                         IconButton(
                        onPressed: () {
                          setState(() {
                        _ratingBer = index + 1;
                       for (int i = 0; i < isSelectedBer.length; i++) {
                              isSelectedBer[i] = i <= index;
                            }
                          });
                        },
                        icon:  Icon(
                          isSelectedBer[index]
                          ? Icons.star
                          : Icons.star_border,
                      color: isSelectedBer[index] ? Colors.yellow : null,),
                      ),
                     ),
                  ),
              const SizedBox(
                height: 5,
              ),
              TextButton(
                style: const ButtonStyle(
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                  backgroundColor: MaterialStatePropertyAll(Colors.blue),
                  shape: MaterialStatePropertyAll(LinearBorder()),
                  minimumSize: MaterialStatePropertyAll(Size(5, 5))),
                onPressed: () {
                  saveRatingA1(_ratingBer);
                  setState(() {
                    _ratingBer = _ratingBer;
                    //saveRatingBer(ratingBer);
                    isvisibleBer = false;
                  });
                  //widget.rating1(ratingBer);
                //avlfBer = avlfBer;
              }, child: const Text('Avaliar'))
            ],
          ),
        ),
      ),
    );
  }
}

class ImgAvlA2 extends StatefulWidget {
  
  const ImgAvlA2({super.key});

  @override
  State<ImgAvlA2> createState() => _ImgAvlA2State();
}


class _ImgAvlA2State extends State<ImgAvlA2> {
String avlfA2 = '';
bool isvisibleA2 = true;
List<bool> isSelectedA2 = List.generate(10, (index) => false);
late double _ratingA2 = 0.0;




void saveRatingA2(double ratingA2) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setDouble('ratingA2', ratingA2);
}
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isvisibleA2,
      child: Container(
        alignment: Alignment.bottomCenter,
        color: Colors.black45,
        height: 224,
        width: 400,
        child: Center(
          child: Column(
            children: [
                Text('Sua Avaliação (De 1 a 10) Avaliação = $_ratingA2',
              style: const TextStyle(color: Colors.blue),),
              const SizedBox(
                height: 5,
              ),
              const Text('Black Cat'),
              const SizedBox(
                height: 5,
              ),
              const Text('Avaliação só atualizará quando trocar de tela',
              style: TextStyle(color: Colors.green),),
              const SizedBox(
                height: 5,
              ),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 0,
                children: List.generate(
                  10,
                  (index) => 
                         IconButton(
                        onPressed: () {
                          setState(() {
                        _ratingA2 = index + 1;
                       for (int i = 0; i < isSelectedA2.length; i++) {
                              isSelectedA2[i] = i <= index;
                            }
                          });
                        },
                        icon:  Icon(
                          isSelectedA2[index]
                          ? Icons.star
                          : Icons.star_border,
                      color: isSelectedA2[index] ? Colors.yellow : null,),
                      ),
                     ),
                  ),
              const SizedBox(
                height: 5,
              ),
              TextButton(
                style: const ButtonStyle(
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                  backgroundColor: MaterialStatePropertyAll(Colors.blue),
                  shape: MaterialStatePropertyAll(LinearBorder()),
                  minimumSize: MaterialStatePropertyAll(Size(5, 5))),
                onPressed: () {
                  saveRatingA2(_ratingA2);
                  setState(() {
                    _ratingA2 = _ratingA2;
                    //saveRating(rating);
                    isvisibleA2 = false;
                  });
                  //widget.rating1(rating);
                //avlf = avlf;
              }, child: const Text('Avaliar'))
            ],
          ),
        ),
      ),
    );
  }
}

class ImgAvlA3 extends StatefulWidget {
  
  const ImgAvlA3({super.key});

  @override
  State<ImgAvlA3> createState() => _ImgAvlA3State();
}


class _ImgAvlA3State extends State<ImgAvlA3> {
String avlf = '';
bool isvisible = true;
List<bool> isSelected = List.generate(10, (index) => false);
late double _ratingA3 = 0.0;




void saveRatingA3(double ratingA3) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setDouble('ratingA3', ratingA3);
}
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isvisible,
      child: Container(
        alignment: Alignment.bottomCenter,
        color: Colors.black45,
        height: 224,
        width: 400,
        child: Center(
          child: Column(
            children: [
                Text('Sua Avaliação (De 1 a 10) Avaliação = $_ratingA3',
              style: const TextStyle(color: Colors.blue),),
              const SizedBox(
                height: 5,
              ),
              const Text('Blue Lock'),
              const SizedBox(
                height: 5,
              ),
              const Text('Avaliação só atualizará quando trocar de tela',
              style: TextStyle(color: Colors.green),),
              const SizedBox(
                height: 5,
              ),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 0,
                children: List.generate(
                  10,
                  (index) => 
                         IconButton(
                        onPressed: () {
                          setState(() {
                        _ratingA3 = index + 1;
                       for (int i = 0; i < isSelected.length; i++) {
                              isSelected[i] = i <= index;
                            }
                          });
                        },
                        icon:  Icon(
                          isSelected[index]
                          ? Icons.star
                          : Icons.star_border,
                      color: isSelected[index] ? Colors.yellow : null,),
                      ),
                     ),
                  ),
              const SizedBox(
                height: 5,
              ),
              TextButton(
                style: const ButtonStyle(
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                  backgroundColor: MaterialStatePropertyAll(Colors.blue),
                  shape: MaterialStatePropertyAll(LinearBorder()),
                  minimumSize: MaterialStatePropertyAll(Size(5, 5))),
                onPressed: () {
                  saveRatingA3(_ratingA3);
                  setState(() {
                    _ratingA3 = _ratingA3;
                    //saveRating(rating);
                    isvisible = false;
                  });
                  //widget.rating1(rating);
                //avlf = avlf;
              }, child: const Text('Avaliar'))
            ],
          ),
        ),
      ),
    );
  }
}

class ImgAvlA4 extends StatefulWidget {
  
  const ImgAvlA4({super.key});

  @override
  State<ImgAvlA4> createState() => _ImgAvlA4State();
}


class _ImgAvlA4State extends State<ImgAvlA4> {
String avlf4 = '';
bool isvisible = true;
List<bool> isSelected = List.generate(10, (index) => false);
late double _ratingA4 = 0.0;




void saveRatingA4(double ratingA4) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setDouble('ratingA4', ratingA4);
}
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isvisible,
      child: Container(
        alignment: Alignment.bottomCenter,
        color: Colors.black45,
        height: 224,
        width: 400,
        child: Center(
          child: Column(
            children: [
                Text('Sua Avaliação (De 1 a 10) Avaliação = $_ratingA4',
              style: const TextStyle(color: Colors.blue),),
              const SizedBox(
                height: 5,
              ),
              const Text('Cavaleiro dos Zodiacos'),
              const SizedBox(
                height: 5,
              ),
              const Text('Avaliação só atualizará quando trocar de tela',
              style: TextStyle(color: Colors.green),),
              const SizedBox(
                height: 5,
              ),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 0,
                children: List.generate(
                  10,
                  (index) => 
                         IconButton(
                        onPressed: () {
                          setState(() {
                        _ratingA4 = index + 1;
                       for (int i = 0; i < isSelected.length; i++) {
                              isSelected[i] = i <= index;
                            }
                          });
                        },
                        icon:  Icon(
                          isSelected[index]
                          ? Icons.star
                          : Icons.star_border,
                      color: isSelected[index] ? Colors.yellow : null,),
                      ),
                     ),
                  ),
              const SizedBox(
                height: 5,
              ),
              TextButton(
                style: const ButtonStyle(
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                  backgroundColor: MaterialStatePropertyAll(Colors.blue),
                  shape: MaterialStatePropertyAll(LinearBorder()),
                  minimumSize: MaterialStatePropertyAll(Size(5, 5))),
                onPressed: () {
                  saveRatingA4(_ratingA4);
                  setState(() {
                    _ratingA4 = _ratingA4;
                    //saveRating(rating);
                    isvisible = false;
                  });
                  //widget.rating1(rating);
                //avlf = avlf;
              }, child: const Text('Avaliar'))
            ],
          ),
        ),
      ),
    );
  }
}

class ImgAvlA5 extends StatefulWidget {
  
  const ImgAvlA5({super.key});

  @override
  State<ImgAvlA5> createState() => _ImgAvlA5State();
}


class _ImgAvlA5State extends State<ImgAvlA5> {
String avlf = '';
bool isvisible = true;
List<bool> isSelected = List.generate(10, (index) => false);
late double _ratingA5 = 0.0;




void saveRatingA5(double ratingA5) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setDouble('ratingA5', ratingA5);
}
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isvisible,
      child: Container(
        alignment: Alignment.bottomCenter,
        color: Colors.black45,
        height: 224,
        width: 400,
        child: Center(
          child: Column(
            children: [
                Text('Sua Avaliação (De 1 a 10) Avaliação = $_ratingA5',
              style: const TextStyle(color: Colors.blue),),
              const SizedBox(
                height: 5,
              ),
              const Text('Cavaleiro dos Zodiacos Omega'),
              const SizedBox(
                height: 5,
              ),
              const Text('Avaliação só atualizará quando trocar de tela',
              style: TextStyle(color: Colors.green),),
              const SizedBox(
                height: 5,
              ),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 0,
                children: List.generate(
                  10,
                  (index) => 
                         IconButton(
                        onPressed: () {
                          setState(() {
                        _ratingA5 = index + 1;
                       for (int i = 0; i < isSelected.length; i++) {
                              isSelected[i] = i <= index;
                            }
                          });
                        },
                        icon:  Icon(
                          isSelected[index]
                          ? Icons.star
                          : Icons.star_border,
                      color: isSelected[index] ? Colors.yellow : null,),
                      ),
                     ),
                  ),
              const SizedBox(
                height: 5,
              ),
              TextButton(
                style: const ButtonStyle(
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                  backgroundColor: MaterialStatePropertyAll(Colors.blue),
                  shape: MaterialStatePropertyAll(LinearBorder()),
                  minimumSize: MaterialStatePropertyAll(Size(5, 5))),
                onPressed: () {
                  saveRatingA5(_ratingA5);
                  setState(() {
                    _ratingA5 = _ratingA5;
                    //saveRating(rating);
                    isvisible = false;
                  });
                  //widget.rating1(rating);
                //avlf = avlf;
              }, child: const Text('Avaliar'))
            ],
          ),
        ),
      ),
    );
  }
}

class ImgAvlA6 extends StatefulWidget {
  
  const ImgAvlA6({super.key});

  @override
  State<ImgAvlA6> createState() => _ImgAvlA6State();
}


class _ImgAvlA6State extends State<ImgAvlA6> {
String avlf = '';
bool isvisible = true;
List<bool> isSelected = List.generate(10, (index) => false);
late double _ratingA6 = 0.0;




void saveRatingA6(double ratingA6) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setDouble('ratingA6', ratingA6);
}
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isvisible,
      child: Container(
        alignment: Alignment.bottomCenter,
        color: Colors.black45,
        height: 224,
        width: 400,
        child: Center(
          child: Column(
            children: [
                Text('Sua Avaliação (De 1 a 10) Avaliação = $_ratingA6',
              style: const TextStyle(color: Colors.blue),),
              const SizedBox(
                height: 5,
              ),
              const Text('Cavaleiro dos Zodiacos The Lost Canvas'),
              const SizedBox(
                height: 5,
              ),
              const Text('Avaliação só atualizará quando trocar de tela',
              style: TextStyle(color: Colors.green),),
              const SizedBox(
                height: 5,
              ),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 0,
                children: List.generate(
                  10,
                  (index) => 
                         IconButton(
                        onPressed: () {
                          setState(() {
                        _ratingA6 = index + 1;
                       for (int i = 0; i < isSelected.length; i++) {
                              isSelected[i] = i <= index;
                            }
                          });
                        },
                        icon:  Icon(
                          isSelected[index]
                          ? Icons.star
                          : Icons.star_border,
                      color: isSelected[index] ? Colors.yellow : null,),
                      ),
                     ),
                  ),
              const SizedBox(
                height: 5,
              ),
              TextButton(
                style: const ButtonStyle(
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                  backgroundColor: MaterialStatePropertyAll(Colors.blue),
                  shape: MaterialStatePropertyAll(LinearBorder()),
                  minimumSize: MaterialStatePropertyAll(Size(5, 5))),
                onPressed: () {
                  saveRatingA6(_ratingA6);
                  setState(() {
                    _ratingA6 = _ratingA6;
                    //saveRating(rating);
                    isvisible = false;
                  });
                  //widget.rating1(rating);
                //avlf = avlf;
              }, child: const Text('Avaliar'))
            ],
          ),
        ),
      ),
    );
  }
}

class ImgAvlA7 extends StatefulWidget {
  
  const ImgAvlA7({super.key});

  @override
  State<ImgAvlA7> createState() => _ImgAvlA7State();
}


class _ImgAvlA7State extends State<ImgAvlA7> {
String avlf = '';
bool isvisible = true;
List<bool> isSelected = List.generate(10, (index) => false);
late double _ratingA7 = 0.0;




void saveRatingA7(double ratingA7) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setDouble('ratingA7', ratingA7);
}
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isvisible,
      child: Container(
        alignment: Alignment.bottomCenter,
        color: Colors.black45,
        height: 224,
        width: 400,
        child: Center(
          child: Column(
            children: [
                Text('Sua Avaliação (De 1 a 10) Avaliação = $_ratingA7',
              style: const TextStyle(color: Colors.blue),),
              const SizedBox(
                height: 5,
              ),
              const Text('Demon Slayer'),
              const SizedBox(
                height: 5,
              ),
              const Text('Avaliação só atualizará quando trocar de tela',
              style: TextStyle(color: Colors.green),),
              const SizedBox(
                height: 5,
              ),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 0,
                children: List.generate(
                  10,
                  (index) => 
                         IconButton(
                        onPressed: () {
                          setState(() {
                        _ratingA7 = index + 1;
                       for (int i = 0; i < isSelected.length; i++) {
                              isSelected[i] = i <= index;
                            }
                          });
                        },
                        icon:  Icon(
                          isSelected[index]
                          ? Icons.star
                          : Icons.star_border,
                      color: isSelected[index] ? Colors.yellow : null,),
                      ),
                     ),
                  ),
              const SizedBox(
                height: 5,
              ),
              TextButton(
                style: const ButtonStyle(
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                  backgroundColor: MaterialStatePropertyAll(Colors.blue),
                  shape: MaterialStatePropertyAll(LinearBorder()),
                  minimumSize: MaterialStatePropertyAll(Size(5, 5))),
                onPressed: () {
                  saveRatingA7(_ratingA7);
                  setState(() {
                    _ratingA7 = _ratingA7;
                    //saveRating(rating);
                    isvisible = false;
                  });
                  //widget.rating1(rating);
                //avlf = avlf;
              }, child: const Text('Avaliar'))
            ],
          ),
        ),
      ),
    );
  }
}

class ImgAvlA8 extends StatefulWidget {
  
  const ImgAvlA8({super.key});

  @override
  State<ImgAvlA8> createState() => _ImgAvlA8State();
}


class _ImgAvlA8State extends State<ImgAvlA8> {
String avlf = '';
bool isvisible = true;
List<bool> isSelected = List.generate(10, (index) => false);
late double _ratingA8 = 0.0;




void saveRatingA8(double ratingA8) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setDouble('ratingA8', ratingA8);
}
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isvisible,
      child: Container(
        alignment: Alignment.bottomCenter,
        color: Colors.black45,
        height: 224,
        width: 400,
        child: Center(
          child: Column(
            children: [
                Text('Sua Avaliação (De 1 a 10) Avaliação = $_ratingA8',
              style: const TextStyle(color: Colors.blue),),
              const SizedBox(
                height: 5,
              ),
              const Text('Inuyasha'),
              const SizedBox(
                height: 5,
              ),
              const Text('Avaliação só atualizará quando trocar de tela',
              style: TextStyle(color: Colors.green),),
              const SizedBox(
                height: 5,
              ),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 0,
                children: List.generate(
                  10,
                  (index) => 
                         IconButton(
                        onPressed: () {
                          setState(() {
                        _ratingA8 = index + 1;
                       for (int i = 0; i < isSelected.length; i++) {
                              isSelected[i] = i <= index;
                            }
                          });
                        },
                        icon:  Icon(
                          isSelected[index]
                          ? Icons.star
                          : Icons.star_border,
                      color: isSelected[index] ? Colors.yellow : null,),
                      ),
                     ),
                  ),
              const SizedBox(
                height: 5,
              ),
              TextButton(
                style: const ButtonStyle(
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                  backgroundColor: MaterialStatePropertyAll(Colors.blue),
                  shape: MaterialStatePropertyAll(LinearBorder()),
                  minimumSize: MaterialStatePropertyAll(Size(5, 5))),
                onPressed: () {
                  saveRatingA8(_ratingA8);
                  setState(() {
                    _ratingA8 = _ratingA8;
                    //saveRating(rating);
                    isvisible = false;
                  });
                  //widget.rating1(rating);
                //avlf = avlf;
              }, child: const Text('Avaliar'))
            ],
          ),
        ),
      ),
    );
  }
}

class ImgAvlA9 extends StatefulWidget {
  
  const ImgAvlA9({super.key});

  @override
  State<ImgAvlA9> createState() => _ImgAvlA9State();
}


class _ImgAvlA9State extends State<ImgAvlA9> {
String avlf = '';
bool isvisible = true;
List<bool> isSelected = List.generate(10, (index) => false);
late double _ratingA9 = 0.0;




void saveRatingA9(double ratingA9) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setDouble('ratingA9', ratingA9);
}
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isvisible,
      child: Container(
        alignment: Alignment.bottomCenter,
        color: Colors.black45,
        height: 224,
        width: 400,
        child: Center(
          child: Column(
            children: [
                Text('Sua Avaliação (De 1 a 10) Avaliação = $_ratingA9',
              style: const TextStyle(color: Colors.blue),),
              const SizedBox(
                height: 5,
              ),
              const Text('Naruto'),
              const SizedBox(
                height: 5,
              ),
              const Text('Avaliação só atualizará quando trocar de tela',
              style: TextStyle(color: Colors.green),),
              const SizedBox(
                height: 5,
              ),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 0,
                children: List.generate(
                  10,
                  (index) => 
                         IconButton(
                        onPressed: () {
                          setState(() {
                        _ratingA9 = index + 1;
                       for (int i = 0; i < isSelected.length; i++) {
                              isSelected[i] = i <= index;
                            }
                          });
                        },
                        icon:  Icon(
                          isSelected[index]
                          ? Icons.star
                          : Icons.star_border,
                      color: isSelected[index] ? Colors.yellow : null,),
                      ),
                     ),
                  ),
              const SizedBox(
                height: 5,
              ),
              TextButton(
                style: const ButtonStyle(
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                  backgroundColor: MaterialStatePropertyAll(Colors.blue),
                  shape: MaterialStatePropertyAll(LinearBorder()),
                  minimumSize: MaterialStatePropertyAll(Size(5, 5))),
                onPressed: () {
                  saveRatingA9(_ratingA9);
                  setState(() {
                    _ratingA9 = _ratingA9;
                    //saveRating(rating);
                    isvisible = false;
                  });
                  //widget.rating1(rating);
                //avlf = avlf;
              }, child: const Text('Avaliar'))
            ],
          ),
        ),
      ),
    );
  }
}




