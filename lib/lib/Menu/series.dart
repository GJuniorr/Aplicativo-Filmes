import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class series extends StatefulWidget {
  const series({super.key});

  @override
  State<series> createState() => _seriesState();
}

class _seriesState extends State<series> {
final List<double> _ratingS = List.generate(10, (index) => 0.0);

List<bool> markedS = List.generate(10, (index) => false);

List<bool> markedStarS = List.generate(10, (index) => false);
List<bool> botaoStarS = List.generate(10, (index) => false);

final List<bool> avlS = List.generate(10, (index) => false);

@override
  void initState(){
    super.initState();
    loadBoolValueS();
    loadBoolValueStarS();
    loadRatingS();
  }
  void loadRatingS() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  setState(() {
    _ratingS[0] = prefs.getDouble('ratingS0') ?? 0.0;
    _ratingS[1] = prefs.getDouble('ratingS1') ?? 0.0;
    _ratingS[2] = prefs.getDouble('ratingS2') ?? 0.0;
    _ratingS[3] = prefs.getDouble('ratingS3') ?? 0.0;
    _ratingS[4] = prefs.getDouble('ratingS4') ?? 0.0;
    _ratingS[5] = prefs.getDouble('ratingS5') ?? 0.0;
    _ratingS[6] = prefs.getDouble('ratingS6') ?? 0.0;
    _ratingS[7] = prefs.getDouble('ratingS7') ?? 0.0;
    _ratingS[8] = prefs.getDouble('ratingS8') ?? 0.0;
    _ratingS[9] = prefs.getDouble('ratingS9') ?? 0.0;
    
  });
}

void _toogleMarkS(int index) {
    setState(() {
      markedS[index] = !markedS[index];
      saveBoolValueS();
      
    });
  }

  /*void _toogleMarkStarA(int index) {
    setState(() {
      markedStarA[index] = !markedStarA[index];
      saveBoolValueStarA();
    });
  }*/

  void _toogleMarkStarS(int index){
    setState(() {
      markedStarS[index] = !markedStarS[index];
      saveBoolValueStarS();
      if (markedStarS[index]) {
        avlS[index] = true;
        
      } else {
        avlS[index] = false;
        
      }
    });
  }

void saveBoolValueS() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> markedSIndexes = [];

    for (int i = 0; i < markedS.length; i++) {
      if (markedS[i]) {
        markedSIndexes.add(i.toString());
      }
    }
    prefs.setStringList('markedS_indexes', markedSIndexes);

    //prefs.setStringList('markedA_indexes', markedAIndexes);
  }

  void saveBoolValueStarS() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> markedStarSIndexes = [];
    
    for (int i = 0; i < markedStarS.length; i++) {
      if (markedStarS[i]) {
        markedStarSIndexes.add(i.toString());
        avlS[i] = true;
      }
    }
    prefs.setStringList('marked_starS_indexes', markedStarSIndexes);
  }


  void loadBoolValueS() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? markedSIndexes = prefs.getStringList('markedS_indexes');
    
    if (markedSIndexes != null) {
      setState(() {
        markedS = List.generate(10, (index) => markedSIndexes.contains(index.toString()));
      });
    }
    
  }

   void loadBoolValueStarS() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String>? markedStarSIndexes = prefs.getStringList('marked_starS_indexes');
    if (markedStarSIndexes != null) {
      setState(() {
        markedStarS = List.generate(10, (index) => markedStarSIndexes.contains(index.toString()));
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
                                Navigator.pushNamed(context, 'betterCallSaulScreen');
                              },
                              child: Image.asset('Séries/BetterCallSaul.jpg')),
                            
                          ),
                             Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                   IconButton(onPressed: () {
                                    _toogleMarkStarS(0);
                                    botaoStarS[0] = true;
                                  }, icon:  Icon(markedStarS[0] ? Icons.star_outlined : Icons.star_outline, color: Colors.yellow )),
                                const Text('Better Call Saul',
                                //style: TextStyle(fontSize: 15),
                                textAlign: TextAlign.center,),
                                IconButton(onPressed: () {
                                  _toogleMarkS(0);
                            },
                             icon: Icon(markedS[0] ?Icons.bookmark_added : Icons.bookmark_add_outlined,))
                              ],
                            ),
                             Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.star,
                                color: Colors.yellow),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text('${_ratingS[0]}' ,
                                  //textAlign: TextAlign.center
                                  ),
                                ),
                              ],
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
                                Navigator.pushNamed(context, 'blackMirrorScreen');
                              },
                              child: Image.asset('Séries/BlackMirror.jpg')),
                          ),
                            Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(onPressed: () {
                                    _toogleMarkStarS(1);
                                    botaoStarS[1] = true;
                                  }, icon:  Icon(markedStarS[1] ?Icons.star_outlined : Icons.star_outline, color: Colors.yellow)),
                                const Text('Black Mirror',
                                //style: TextStyle(fontSize: 15),
                                textAlign: TextAlign.center,),
                              IconButton(onPressed: () {
                                _toogleMarkS(1);
                              }, icon: Icon(markedS[1] ?Icons.bookmark_added : Icons.bookmark_add_outlined))
                              ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.star,
                              color: Colors.yellow),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: 
                                Text('${_ratingS[1]}'),)
                            ],
                          )
                        ],
                      ),
                      ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      if (avlS[0] && botaoStarS[0])
                       const ImgAvlS0(),
                      if(avlS[1] && botaoStarS[1])
                      const ImgAvlS1(),
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
                                    Navigator.pushNamed(context, 'breakingBadScreen');
                                  },
                                  child: Image.asset('Séries/BreakingBad.jpg')),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(onPressed: () {
                                        _toogleMarkStarS(2);
                                        botaoStarS[2] = true;
                                      }, icon:  Icon(markedStarS[2] ?Icons.star_outlined : Icons.star_outline, color: Colors.yellow)),
                                  const Text('Breaking Bad',
                                  //style: TextStyle(fontSize: 13),
                                  textAlign: TextAlign.center),
                                  IconButton(onPressed: () {
                                    _toogleMarkS(2);
                                  }, icon: Icon(markedS[2] ?Icons.bookmark_added : Icons.bookmark_add_outlined))
                                ],
                              ),
                              Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.star,
                              color: Colors.yellow),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: 
                                Text('${_ratingS[2]}'),)
                            ],
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
                                    Navigator.pushNamed(context, 'designatedSurvivorScreen');
                                  },
                                  child: Image.asset('Séries/DesignatedSurvivor.jpg')),
                              ),
                                Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                 IconButton(onPressed: () {
                                        _toogleMarkStarS(3);
                                        botaoStarS[3] = true;
                                      }, icon:  Icon(markedStarS[3] ?Icons.star_outlined : Icons.star_outline, color: Colors.yellow)),
                                    const Text('Designated Survivor',
                                    style: TextStyle(fontSize: 13.9),
                                    textAlign: TextAlign.center,),
                                  IconButton(onPressed: () {
                                    _toogleMarkS(3);
                                  }, icon: Icon(markedS[3] ?Icons.bookmark_added : Icons.bookmark_add_outlined))],
                              ),
                              Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.star,
                                color: Colors.yellow),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text('${_ratingS[3]}' ,
                                  //textAlign: TextAlign.center
                                  ),
                                ),
                              ],
                              ),
                            ],
                          ),
                          ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          if(avlS[2] && botaoStarS[2])
                          const ImgAvlS2(),
                          if(avlS[3] && botaoStarS[3])
                          const ImgAvlS3(),
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
                                Navigator.pushNamed(context, 'narcosScreen');
                              },
                              child: Image.asset('Séries/Narcos.jpg')),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(onPressed: () {
                                    _toogleMarkStarS(4);
                                    botaoStarS[4] = true;
                                  }, icon:  Icon(markedStarS[4] ?Icons.star_outlined : Icons.star_outline, color: Colors.yellow)),
                              const Text('Narcos',
                              //style: TextStyle(fontSize: 13),
                              textAlign: TextAlign.center),
                              IconButton(onPressed: () {
                                _toogleMarkS(4);
                              }, icon: Icon(markedS[4] ? Icons.bookmark_added : Icons.bookmark_add_outlined))
                            ],
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.star,
                                color: Colors.yellow),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text('${_ratingS[4]}' ,
                                  //textAlign: TextAlign.center
                                  ),
                                ),
                              ],
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
                                Navigator.pushNamed(context, 'sintoniaScreen');
                              },
                              child: Image.asset('Séries/Sintonia.jpg')),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(onPressed: () {
                                    _toogleMarkStarS(5);
                                    botaoStarS[5] = true;
                                  }, icon:  Icon(markedStarS[5] ?Icons.star_outlined : Icons.star_outline, color: Colors.yellow)),
                              const Text('Sintonia',
                              textAlign: TextAlign.center),
                              IconButton(onPressed: () {
                                _toogleMarkS(5);
                                botaoStarS[5] = true;
                              }, icon: Icon(markedS[5] ? Icons.bookmark_added : Icons.bookmark_add_outlined))
                            ],
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.star,
                                color: Colors.yellow),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text('${_ratingS[5]}' ,
                                  //textAlign: TextAlign.center
                                  ),
                                ),
                              ],
                              ),
                        ],
                      ),
                        ),
                      ),
                  ],
                ),
                Column(
                  children: [
                    if(avlS[4] && botaoStarS[4])
                    const ImgAvlS4(),
                    if(avlS[5] && botaoStarS[5])
                    const ImgAvlS5(),
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
                                Navigator.pushNamed(context, 'suitsScreen');
                              },
                              child: Image.asset('Séries/Suits.jpg')),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(onPressed: () {
                                    _toogleMarkStarS(6);
                                    botaoStarS[6] = true;
                                  }, icon:  Icon(markedStarS[6] ?Icons.star_outlined : Icons.star_outline, color: Colors.yellow)),
                              const Text('Suits',
                             //style: TextStyle(fontSize: 10),
                              textAlign: TextAlign.center),
                              IconButton(onPressed: () {
                                _toogleMarkS(6);
                              }, icon: Icon(markedS[6] ? Icons.bookmark_added : Icons.bookmark_add_outlined))
                            ],
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.star,
                                color: Colors.yellow),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text('${_ratingS[6]}' ,
                                  //textAlign: TextAlign.center
                                  ),
                                ),
                              ],
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
                                Navigator.pushNamed(context, 'supernaturalScreen');
                              },
                              child: Image.asset('Séries/Supernatural.jpg')),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(onPressed: () {
                                    _toogleMarkStarS(7);
                                    botaoStarS[7] = true;
                                  }, icon:  Icon(markedStarS[7] ?Icons.star_outlined : Icons.star_outline, color: Colors.yellow)),
                              const Text('Supernatural',
                              //style: TextStyle(fontSize: 12),
                              textAlign: TextAlign.center),
                              IconButton(onPressed: () {
                                _toogleMarkS(7);
                              }, icon: Icon(markedS[7] ? Icons.bookmark_added : Icons.bookmark_add_outlined))
                            ],
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.star,
                                color: Colors.yellow),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text('${_ratingS[7]}' ,
                                  //textAlign: TextAlign.center
                                  ),
                                ),
                              ],
                              ),
                        ],
                      ),
                        ),
                      ),
                  ],
                ),
                Column(
                  children: [
                    if(avlS[6] && botaoStarS[6])
                    const ImgAvlS6(),
                    if(avlS[7] && botaoStarS[7])
                    const ImgAvlS7(),
                    if(avlS[8] && botaoStarS[8])
                    const ImgAvlS8(),
                    if(avlS[9] && botaoStarS[9])
                    const ImgAvlS9(),
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
                                Navigator.pushNamed(context, 'vikingsScreen');
                              },
                              child: Image.asset('Séries/Vikings.jpg')),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(onPressed: () {
                                    _toogleMarkStarS(8);
                                    botaoStarS[8] = true;
                                  }, icon:  Icon(markedStarS[8] ?Icons.star_outlined : Icons.star_outline, color: Colors.yellow)),
                              const Text('Vikings',
                             // style: TextStyle(fontSize: 9.2),
                              textAlign: TextAlign.center),
                              IconButton(onPressed: () {
                                _toogleMarkS(8);
                              }, icon: Icon(markedS[8] ? Icons.bookmark_added : Icons.bookmark_add_outlined))
                            ],
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.star,
                                color: Colors.yellow),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text('${_ratingS[8]}' ,
                                  //textAlign: TextAlign.center
                                  ),
                                ),
                              ],
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
                                Navigator.pushNamed(context, 'youScreen');
                              },
                              child: Image.asset('Séries/You.jpg')),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                             IconButton(onPressed: () {
                                    _toogleMarkStarS(9);
                                    botaoStarS[9] = true;
                                  }, icon:  Icon(markedStarS[9] ?Icons.star_outlined : Icons.star_outline, color: Colors.yellow)),
                              const Text('You',
                              textAlign: TextAlign.center),
                              IconButton(onPressed: () {
                                _toogleMarkS(9);
                              }, icon: Icon(markedS[9] ? Icons.bookmark_added : Icons.bookmark_add_outlined))
                            ],
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.star,
                                color: Colors.yellow),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text('${_ratingS[9]}' ,
                                  //textAlign: TextAlign.center
                                  ),
                                ),
                              ],
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


class ImgAvlS0 extends StatefulWidget {
  
  const ImgAvlS0({super.key});

  @override
  State<ImgAvlS0> createState() => _ImgAvlS0State();
}


class _ImgAvlS0State extends State<ImgAvlS0> {
String avlS0 = '';
bool isvisibleS0 = true;
List<bool> isSelectedS0 = List.generate(10, (index) => false);
late double _ratingS0 = 0.0;




void saveRatingS0(double ratingS0) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setDouble('ratingS0', ratingS0);
}
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isvisibleS0,
      child: Container(
        alignment: Alignment.bottomCenter,
        color: Colors.black45,
        height: 224,
        width: 400,
        child: Center(
          child: Column(
            children: [
                Text('Sua Avaliação (De 1 a 10) Avaliação = $_ratingS0',
              style: const TextStyle(color: Colors.blue),),
              const SizedBox(
                height: 5,
              ),
              const Text('Better Call Saul'),
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
                        _ratingS0 = index + 1;
                       for (int i = 0; i < isSelectedS0.length; i++) {
                              isSelectedS0[i] = i <= index;
                            }
                          });
                        },
                        icon:  Icon(
                          isSelectedS0[index]
                          ? Icons.star
                          : Icons.star_border,
                      color: isSelectedS0[index] ? Colors.yellow : null,),
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
                  saveRatingS0(_ratingS0);
                  setState(() {
                    _ratingS0 = _ratingS0;
                    //saveRating(rating);
                    isvisibleS0 = false;
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


class ImgAvlS1 extends StatefulWidget {
  
  const ImgAvlS1({super.key});

  @override
  State<ImgAvlS1> createState() => _ImgAvlS1State();
}

class _ImgAvlS1State extends State<ImgAvlS1> {
String avlfS1 = '';
bool isvisibleS1 = true;
List<bool> isSelectedS1 = List.generate(10, (index) => false);
late double _ratingS1 = 0.0;


/*void setRatingBer(double newRatingBer){
  setState(() {
    _ratingBer = newRatingBer;
  });
  _animesState().updateRatingBer(newRatingBer);
}*/

void saveRatingS1(double ratingS1) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setDouble('ratingS1', ratingS1);
}
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isvisibleS1,
      child: Container(
        alignment: Alignment.bottomCenter,
        color: Colors.black45,
        height: 224,
        width: 400,
        child: Center(
          child: Column(
            children: [
                Text('Sua Avaliação (De 1 a 10) Avaliação = $_ratingS1',
              style: const TextStyle(color: Colors.blue),),
              const SizedBox(
                height: 5,
              ),
              const Text('Black Mirror'),
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
                        _ratingS1 = index + 1;
                       for (int i = 0; i < isSelectedS1.length; i++) {
                              isSelectedS1[i] = i <= index;
                            }
                          });
                        },
                        icon:  Icon(
                          isSelectedS1[index]
                          ? Icons.star
                          : Icons.star_border,
                      color: isSelectedS1[index] ? Colors.yellow : null,),
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
                  saveRatingS1(_ratingS1);
                  setState(() {
                    _ratingS1 = _ratingS1;
                    //saveRatingBer(ratingBer);
                    isvisibleS1 = false;
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

class ImgAvlS2 extends StatefulWidget {
  
  const ImgAvlS2({super.key});

  @override
  State<ImgAvlS2> createState() => _ImgAvlS2State();
}


class _ImgAvlS2State extends State<ImgAvlS2> {
String avlS2 = '';
bool isvisibleS2 = true;
List<bool> isSelectedS2 = List.generate(10, (index) => false);
late double _ratingS2 = 0.0;




void saveRatingS2(double ratingS2) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setDouble('ratingS2', ratingS2);
}
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isvisibleS2,
      child: Container(
        alignment: Alignment.bottomCenter,
        color: Colors.black45,
        height: 224,
        width: 400,
        child: Center(
          child: Column(
            children: [
                Text('Sua Avaliação (De 1 a 10) Avaliação = $_ratingS2',
              style: const TextStyle(color: Colors.blue),),
              const SizedBox(
                height: 5,
              ),
              const Text('Breaking Bad'),
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
                        _ratingS2 = index + 1;
                       for (int i = 0; i < isSelectedS2.length; i++) {
                              isSelectedS2[i] = i <= index;
                            }
                          });
                        },
                        icon:  Icon(
                          isSelectedS2[index]
                          ? Icons.star
                          : Icons.star_border,
                      color: isSelectedS2[index] ? Colors.yellow : null,),
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
                  saveRatingS2(_ratingS2);
                  setState(() {
                    _ratingS2 = _ratingS2;
                    //saveRating(rating);
                    isvisibleS2 = false;
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

class ImgAvlS3 extends StatefulWidget {
  
  const ImgAvlS3({super.key});

  @override
  State<ImgAvlS3> createState() => _ImgAvlS3State();
}


class _ImgAvlS3State extends State<ImgAvlS3> {
String avlS3 = '';
bool isvisibleS3 = true;
List<bool> isSelectedS3 = List.generate(10, (index) => false);
late double _ratingS3 = 0.0;




void saveRatingS3(double ratingS3) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setDouble('ratingS3', ratingS3);
}
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isvisibleS3,
      child: Container(
        alignment: Alignment.bottomCenter,
        color: Colors.black45,
        height: 224,
        width: 400,
        child: Center(
          child: Column(
            children: [
                Text('Sua Avaliação (De 1 a 10) Avaliação = $_ratingS3',
              style: const TextStyle(color: Colors.blue),),
              const SizedBox(
                height: 5,
              ),
              const Text('Designated Survivor'),
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
                        _ratingS3 = index + 1;
                       for (int i = 0; i < isSelectedS3.length; i++) {
                              isSelectedS3[i] = i <= index;
                            }
                          });
                        },
                        icon:  Icon(
                          isSelectedS3[index]
                          ? Icons.star
                          : Icons.star_border,
                      color: isSelectedS3[index] ? Colors.yellow : null,),
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
                  saveRatingS3(_ratingS3);
                  setState(() {
                    _ratingS3 = _ratingS3;
                    //saveRating(rating);
                    isvisibleS3 = false;
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

class ImgAvlS4 extends StatefulWidget {
  
  const ImgAvlS4({super.key});

  @override
  State<ImgAvlS4> createState() => _ImgAvlS4State();
}


class _ImgAvlS4State extends State<ImgAvlS4> {
String avlS4 = '';
bool isvisibleS4 = true;
List<bool> isSelectedS4 = List.generate(10, (index) => false);
late double _ratingS4 = 0.0;




void saveRatingS4(double ratingS4) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setDouble('ratingS4', ratingS4);
}
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isvisibleS4,
      child: Container(
        alignment: Alignment.bottomCenter,
        color: Colors.black45,
        height: 224,
        width: 400,
        child: Center(
          child: Column(
            children: [
                Text('Sua Avaliação (De 1 a 10) Avaliação = $_ratingS4',
              style: const TextStyle(color: Colors.blue),),
              const SizedBox(
                height: 5,
              ),
              const Text('Narcos'),
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
                        _ratingS4 = index + 1;
                       for (int i = 0; i < isSelectedS4.length; i++) {
                              isSelectedS4[i] = i <= index;
                            }
                          });
                        },
                        icon:  Icon(
                          isSelectedS4[index]
                          ? Icons.star
                          : Icons.star_border,
                      color: isSelectedS4[index] ? Colors.yellow : null,),
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
                  saveRatingS4(_ratingS4);
                  setState(() {
                    _ratingS4 = _ratingS4;
                    //saveRating(rating);
                    isvisibleS4 = false;
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

class ImgAvlS5 extends StatefulWidget {
  
  const ImgAvlS5({super.key});

  @override
  State<ImgAvlS5> createState() => _ImgAvlS5State();
}


class _ImgAvlS5State extends State<ImgAvlS5> {
String avlS5 = '';
bool isvisibleS5 = true;
List<bool> isSelectedS5 = List.generate(10, (index) => false);
late double _ratingS5 = 0.0;




void saveRatingS5(double ratingS5) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setDouble('ratingS5', ratingS5);
}
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isvisibleS5,
      child: Container(
        alignment: Alignment.bottomCenter,
        color: Colors.black45,
        height: 224,
        width: 400,
        child: Center(
          child: Column(
            children: [
                Text('Sua Avaliação (De 1 a 10) Avaliação = $_ratingS5',
              style: const TextStyle(color: Colors.blue),),
              const SizedBox(
                height: 5,
              ),
              const Text('Sintonia'),
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
                        _ratingS5 = index + 1;
                       for (int i = 0; i < isSelectedS5.length; i++) {
                              isSelectedS5[i] = i <= index;
                            }
                          });
                        },
                        icon:  Icon(
                          isSelectedS5[index]
                          ? Icons.star
                          : Icons.star_border,
                      color: isSelectedS5[index] ? Colors.yellow : null,),
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
                  saveRatingS5(_ratingS5);
                  setState(() {
                    _ratingS5 = _ratingS5;
                    //saveRating(rating);
                    isvisibleS5 = false;
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

class ImgAvlS6 extends StatefulWidget {
  
  const ImgAvlS6({super.key});

  @override
  State<ImgAvlS6> createState() => _ImgAvlS6State();
}


class _ImgAvlS6State extends State<ImgAvlS6> {
String avlS6 = '';
bool isvisibleS6 = true;
List<bool> isSelectedS6 = List.generate(10, (index) => false);
late double _ratingS6 = 0.0;




void saveRatingS6(double ratingS6) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setDouble('ratingS6', ratingS6);
}
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isvisibleS6,
      child: Container(
        alignment: Alignment.bottomCenter,
        color: Colors.black45,
        height: 224,
        width: 400,
        child: Center(
          child: Column(
            children: [
                Text('Sua Avaliação (De 1 a 10) Avaliação = $_ratingS6',
              style: const TextStyle(color: Colors.blue),),
              const SizedBox(
                height: 5,
              ),
              const Text('Suits'),
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
                        _ratingS6 = index + 1;
                       for (int i = 0; i < isSelectedS6.length; i++) {
                              isSelectedS6[i] = i <= index;
                            }
                          });
                        },
                        icon:  Icon(
                          isSelectedS6[index]
                          ? Icons.star
                          : Icons.star_border,
                      color: isSelectedS6[index] ? Colors.yellow : null,),
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
                  saveRatingS6(_ratingS6);
                  setState(() {
                    _ratingS6 = _ratingS6;
                    //saveRating(rating);
                    isvisibleS6 = false;
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

class ImgAvlS7 extends StatefulWidget {
  
  const ImgAvlS7({super.key});

  @override
  State<ImgAvlS7> createState() => _ImgAvlS7State();
}


class _ImgAvlS7State extends State<ImgAvlS7> {
String avlS7 = '';
bool isvisibleS7 = true;
List<bool> isSelectedS7 = List.generate(10, (index) => false);
late double _ratingS7 = 0.0;




void saveRatingS7(double ratingS7) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setDouble('ratingS7', ratingS7);
}
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isvisibleS7,
      child: Container(
        alignment: Alignment.bottomCenter,
        color: Colors.black45,
        height: 224,
        width: 400,
        child: Center(
          child: Column(
            children: [
                Text('Sua Avaliação (De 1 a 10) Avaliação = $_ratingS7',
              style: const TextStyle(color: Colors.blue),),
              const SizedBox(
                height: 5,
              ),
              const Text('Supernatural'),
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
                        _ratingS7 = index + 1;
                       for (int i = 0; i < isSelectedS7.length; i++) {
                              isSelectedS7[i] = i <= index;
                            }
                          });
                        },
                        icon:  Icon(
                          isSelectedS7[index]
                          ? Icons.star
                          : Icons.star_border,
                      color: isSelectedS7[index] ? Colors.yellow : null,),
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
                  saveRatingS7(_ratingS7);
                  setState(() {
                    _ratingS7 = _ratingS7;
                    //saveRating(rating);
                    isvisibleS7 = false;
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

class ImgAvlS8 extends StatefulWidget {
  
  const ImgAvlS8({super.key});

  @override
  State<ImgAvlS8> createState() => _ImgAvlS8State();
}


class _ImgAvlS8State extends State<ImgAvlS8> {
String avlS8 = '';
bool isvisibleS8 = true;
List<bool> isSelectedS8 = List.generate(10, (index) => false);
late double _ratingS8 = 0.0;




void saveRatingS8(double ratingS8) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setDouble('ratingS8', ratingS8);
}
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isvisibleS8,
      child: Container(
        alignment: Alignment.bottomCenter,
        color: Colors.black45,
        height: 224,
        width: 400,
        child: Center(
          child: Column(
            children: [
                Text('Sua Avaliação (De 1 a 10) Avaliação = $_ratingS8',
              style: const TextStyle(color: Colors.blue),),
              const SizedBox(
                height: 5,
              ),
              const Text('Vikings'),
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
                        _ratingS8 = index + 1;
                       for (int i = 0; i < isSelectedS8.length; i++) {
                              isSelectedS8[i] = i <= index;
                            }
                          });
                        },
                        icon:  Icon(
                          isSelectedS8[index]
                          ? Icons.star
                          : Icons.star_border,
                      color: isSelectedS8[index] ? Colors.yellow : null,),
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
                  saveRatingS8(_ratingS8);
                  setState(() {
                    _ratingS8 = _ratingS8;
                    //saveRating(rating);
                    isvisibleS8 = false;
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

class ImgAvlS9 extends StatefulWidget {
  
  const ImgAvlS9({super.key});

  @override
  State<ImgAvlS9> createState() => _ImgAvlS9State();
}


class _ImgAvlS9State extends State<ImgAvlS9> {
String avlS9 = '';
bool isvisibleS9 = true;
List<bool> isSelectedS9 = List.generate(10, (index) => false);
late double _ratingS9 = 0.0;




void saveRatingS9(double ratingS9) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setDouble('ratingS9', ratingS9);
}
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isvisibleS9,
      child: Container(
        alignment: Alignment.bottomCenter,
        color: Colors.black45,
        height: 224,
        width: 400,
        child: Center(
          child: Column(
            children: [
                Text('Sua Avaliação (De 1 a 10) Avaliação = $_ratingS9',
              style: const TextStyle(color: Colors.blue),),
              const SizedBox(
                height: 5,
              ),
              const Text('You'),
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
                        _ratingS9 = index + 1;
                       for (int i = 0; i < isSelectedS9.length; i++) {
                              isSelectedS9[i] = i <= index;
                            }
                          });
                        },
                        icon:  Icon(
                          isSelectedS9[index]
                          ? Icons.star
                          : Icons.star_border,
                      color: isSelectedS9[index] ? Colors.yellow : null,),
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
                  saveRatingS9(_ratingS9);
                  setState(() {
                    _ratingS9 = _ratingS9;
                    //saveRating(rating);
                    isvisibleS9 = false;
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




