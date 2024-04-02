import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class filmes extends StatefulWidget {
  const filmes({super.key});

  @override
  State<filmes> createState() => _filmesState();
}

class _filmesState extends State<filmes> {
final List<double> _ratingF = List.generate(10, (index) => 0.0);

List<bool> markedF = List.generate(10, (index) => false);

List<bool> markedStarF = List.generate(10, (index) => false);
List<bool> botaoStarF = List.generate(10, (index) => false);

final List<bool> avlF = List.generate(10, (index) => false);

@override
  void initState(){
    super.initState();
    loadBoolValueF();
    loadBoolValueStarF();
    loadRatingF();
  }
  void loadRatingF() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  setState(() {
    _ratingF[0] = prefs.getDouble('ratingF0') ?? 0.0;
    _ratingF[1] = prefs.getDouble('ratingF1') ?? 0.0;
    _ratingF[2] = prefs.getDouble('ratingF2') ?? 0.0;
    _ratingF[3] = prefs.getDouble('ratingF3') ?? 0.0;
    _ratingF[4] = prefs.getDouble('ratingF4') ?? 0.0;
    _ratingF[5] = prefs.getDouble('ratingF5') ?? 0.0;
    _ratingF[6] = prefs.getDouble('ratingF6') ?? 0.0;
    _ratingF[7] = prefs.getDouble('ratingF7') ?? 0.0;
    _ratingF[8] = prefs.getDouble('ratingF8') ?? 0.0;
    _ratingF[9] = prefs.getDouble('ratingF9') ?? 0.0;
    
  });
}

void _toogleMarkF(int index) {
    setState(() {
      markedF[index] = !markedF[index];
      saveBoolValueF();
      
    });
  }

  /*void _toogleMarkStarA(int index) {
    setState(() {
      markedStarA[index] = !markedStarA[index];
      saveBoolValueStarA();
    });
  }*/

  void _toogleMarkStarF(int index){
    setState(() {
      markedStarF[index] = !markedStarF[index];
      saveBoolValueStarF();
      if (markedStarF[index]) {
        avlF[index] = true;
        
      } else {
        avlF[index] = false;
        
      }
    });
  }

void saveBoolValueF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> markedFIndexes = [];

    for (int i = 0; i < markedF.length; i++) {
      if (markedF[i]) {
        markedFIndexes.add(i.toString());
      }
    }
    prefs.setStringList('markedF_indexes', markedFIndexes);

    //prefs.setStringList('markedA_indexes', markedAIndexes);
  }

  void saveBoolValueStarF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> markedStarFIndexes = [];
    
    for (int i = 0; i < markedStarF.length; i++) {
      if (markedStarF[i]) {
        markedStarFIndexes.add(i.toString());
        avlF[i] = true;
      }
    }
    prefs.setStringList('marked_starF_indexes', markedStarFIndexes);
  }


  void loadBoolValueF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? markedFIndexes = prefs.getStringList('markedF_indexes');
    
    if (markedFIndexes != null) {
      setState(() {
        markedF = List.generate(10, (index) => markedFIndexes.contains(index.toString()));
      });
    }
    
  }

   void loadBoolValueStarF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String>? markedStarFIndexes = prefs.getStringList('marked_starF_indexes');
    if (markedStarFIndexes != null) {
      setState(() {
        markedStarF = List.generate(10, (index) => markedStarFIndexes.contains(index.toString()));
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
                            child: Image.asset('Filmes/CidadedeDeus.jpg'),
                            
                          ),
                             Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                   IconButton(onPressed: () {
                                    _toogleMarkStarF(0);
                                    botaoStarF[0] = true;
                                  }, icon:  Icon(markedStarF[0] ? Icons.star_outlined : Icons.star_outline, color: Colors.yellow )),
                                const Text('Cidade de Deus',
                                //style: TextStyle(fontSize: 15),
                                textAlign: TextAlign.center,),
                                IconButton(onPressed: () {
                                  _toogleMarkF(0);
                            },
                             icon: Icon(markedF[0] ?Icons.bookmark_added : Icons.bookmark_add_outlined,))
                              ],
                            ),
                             Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.star,
                                color: Colors.yellow),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text('${_ratingF[0]}' ,
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
                            child: Image.asset('Filmes/ClubedaLuta.jpg'),
                          ),
                            Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(onPressed: () {
                                    _toogleMarkStarF(1);
                                    botaoStarF[1] = true;
                                  }, icon:  Icon(markedStarF[1] ?Icons.star_outlined : Icons.star_outline, color: Colors.yellow)),
                                const Text('Clube da Luta',
                                //style: TextStyle(fontSize: 15),
                                textAlign: TextAlign.center,),
                              IconButton(onPressed: () {
                                _toogleMarkF(1);
                              }, icon: Icon(markedF[1] ?Icons.bookmark_added : Icons.bookmark_add_outlined))
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
                                Text('${_ratingF[1]}'),)
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
                      if (avlF[0] && botaoStarF[0])
                       const ImgAvlF0(),
                      if(avlF[1] && botaoStarF[1])
                      const ImgAvlF1(),
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
                                child: Image.asset('Filmes/GarotaExemplar.jpg'),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(onPressed: () {
                                        _toogleMarkStarF(2);
                                        botaoStarF[2] = true;
                                      }, icon:  Icon(markedStarF[2] ?Icons.star_outlined : Icons.star_outline, color: Colors.yellow)),
                                  const Text('Garota Exemplar',
                                  //style: TextStyle(fontSize: 13),
                                  textAlign: TextAlign.center),
                                  IconButton(onPressed: () {
                                    _toogleMarkF(2);
                                  }, icon: Icon(markedF[2] ?Icons.bookmark_added : Icons.bookmark_add_outlined))
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
                                Text('${_ratingF[2]}'),)
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
                                child: Image.asset('Filmes/GenioIndomavel.jpg'),
                              ),
                                Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                 IconButton(onPressed: () {
                                        _toogleMarkStarF(3);
                                        botaoStarF[3] = true;
                                      }, icon:  Icon(markedStarF[3] ?Icons.star_outlined : Icons.star_outline, color: Colors.yellow)),
                                    const Text('Gênio Indomável',
                                    //style: TextStyle(fontSize: 12),
                                    textAlign: TextAlign.center,),
                                  IconButton(onPressed: () {
                                    _toogleMarkF(3);
                                  }, icon: Icon(markedF[3] ?Icons.bookmark_added : Icons.bookmark_add_outlined))],
                              ),
                              Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.star,
                                color: Colors.yellow),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text('${_ratingF[3]}' ,
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
                          if(avlF[2] && botaoStarF[2])
                          const ImgAvlF2(),
                          if(avlF[3] && botaoStarF[3])
                          const ImgAvlF3(),
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
                            child: Image.asset('Filmes/GigantesdeAco.jpg'),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(onPressed: () {
                                    _toogleMarkStarF(4);
                                    botaoStarF[4] = true;
                                  }, icon:  Icon(markedStarF[4] ?Icons.star_outlined : Icons.star_outline, color: Colors.yellow)),
                              const Text('Gigantes de Aco',
                              //style: TextStyle(fontSize: 14),
                              textAlign: TextAlign.center),
                              IconButton(onPressed: () {
                                _toogleMarkF(4);
                              }, icon: Icon(markedF[4] ? Icons.bookmark_added : Icons.bookmark_add_outlined))
                            ],
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.star,
                                color: Colors.yellow),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text('${_ratingF[4]}' ,
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
                            child: Image.asset('Filmes/MulherRei.jpg'),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(onPressed: () {
                                    _toogleMarkStarF(5);
                                    botaoStarF[5] = true;
                                  }, icon:  Icon(markedStarF[5] ?Icons.star_outlined : Icons.star_outline, color: Colors.yellow)),
                              const Text('Mulher Rei',
                              textAlign: TextAlign.center),
                              IconButton(onPressed: () {
                                _toogleMarkF(5);
                                botaoStarF[5] = true;
                              }, icon: Icon(markedF[5] ? Icons.bookmark_added : Icons.bookmark_add_outlined))
                            ],
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.star,
                                color: Colors.yellow),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text('${_ratingF[5]}' ,
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
                    if(avlF[4] && botaoStarF[4])
                    const ImgAvlF4(),
                    if(avlF[5] && botaoStarF[5])
                    const ImgAvlF5(),
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
                            child: Image.asset('Filmes/PsicopataAmericano.jpg'),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(onPressed: () {
                                    _toogleMarkStarF(6);
                                    botaoStarF[6] = true;
                                  }, icon:  Icon(markedStarF[6] ?Icons.star_outlined : Icons.star_outline, color: Colors.yellow)),
                              const Text('Psicopata Americano',
                              style: TextStyle(fontSize: 13),
                              textAlign: TextAlign.center),
                              IconButton(onPressed: () {
                                _toogleMarkF(6);
                              }, icon: Icon(markedF[6] ? Icons.bookmark_added : Icons.bookmark_add_outlined))
                            ],
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.star,
                                color: Colors.yellow),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text('${_ratingF[6]}' ,
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
                            child: Image.asset('Filmes/QuestaodeTempo.jpg'),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(onPressed: () {
                                    _toogleMarkStarF(7);
                                    botaoStarF[7] = true;
                                  }, icon:  Icon(markedStarF[7] ?Icons.star_outlined : Icons.star_outline, color: Colors.yellow)),
                              const Text('Questão de Tempo',
                              //style: TextStyle(fontSize: 12),
                              textAlign: TextAlign.center),
                              IconButton(onPressed: () {
                                _toogleMarkF(7);
                              }, icon: Icon(markedF[7] ? Icons.bookmark_added : Icons.bookmark_add_outlined))
                            ],
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.star,
                                color: Colors.yellow),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text('${_ratingF[7]}' ,
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
                    if(avlF[6] && botaoStarF[6])
                    const ImgAvlF6(),
                    if(avlF[7] && botaoStarF[7])
                    const ImgAvlF7(),
                    if(avlF[8] && botaoStarF[8])
                    const ImgAvlF8(),
                    if(avlF[9] && botaoStarF[9])
                    const ImgAvlF9(),
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
                            child: Image.asset('Filmes/SimplesmenteAcontece.jpg'),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(onPressed: () {
                                    _toogleMarkStarF(8);
                                    botaoStarF[8] = true;
                                  }, icon:  Icon(markedStarF[8] ?Icons.star_outlined : Icons.star_outline, color: Colors.yellow)),
                              const Text('Simplesmente Acontece',
                              style: TextStyle(fontSize: 11.4),
                              textAlign: TextAlign.center),
                              IconButton(onPressed: () {
                                _toogleMarkF(8);
                              }, icon: Icon(markedF[8] ? Icons.bookmark_added : Icons.bookmark_add_outlined))
                            ],
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.star,
                                color: Colors.yellow),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text('${_ratingF[8]}' ,
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
                            child: Image.asset('Filmes/TropadeElite.jpg'),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                             IconButton(onPressed: () {
                                    _toogleMarkStarF(9);
                                    botaoStarF[9] = true;
                                  }, icon:  Icon(markedStarF[9] ?Icons.star_outlined : Icons.star_outline, color: Colors.yellow)),
                              const Text('Tropa de Elite',
                              textAlign: TextAlign.center),
                              IconButton(onPressed: () {
                                _toogleMarkF(9);
                              }, icon: Icon(markedF[9] ? Icons.bookmark_added : Icons.bookmark_add_outlined))
                            ],
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.star,
                                color: Colors.yellow),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text('${_ratingF[9]}' ,
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


class ImgAvlF0 extends StatefulWidget {
  
  const ImgAvlF0({super.key});

  @override
  State<ImgAvlF0> createState() => _ImgAvlF0State();
}


class _ImgAvlF0State extends State<ImgAvlF0> {
String avlf = '';
bool isvisible = true;
List<bool> isSelected = List.generate(10, (index) => false);
late double _ratingF0 = 0.0;




void saveRatingF0(double ratingF0) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setDouble('ratingF0', ratingF0);
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
                Text('Sua Avaliação (De 1 a 10) Avaliação = $_ratingF0',
              style: const TextStyle(color: Colors.blue),),
              const SizedBox(
                height: 5,
              ),
              const Text('Cidade de Deus'),
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
                        _ratingF0 = index + 1;
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
                  saveRatingF0(_ratingF0);
                  setState(() {
                    _ratingF0 = _ratingF0;
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


class ImgAvlF1 extends StatefulWidget {
  
  const ImgAvlF1({super.key});

  @override
  State<ImgAvlF1> createState() => _ImgAvlF1State();
}

class _ImgAvlF1State extends State<ImgAvlF1> {
String avlfF1 = '';
bool isvisibleF1 = true;
List<bool> isSelectedF1 = List.generate(10, (index) => false);
late double _ratingF1 = 0.0;


/*void setRatingBer(double newRatingBer){
  setState(() {
    _ratingBer = newRatingBer;
  });
  _animesState().updateRatingBer(newRatingBer);
}*/

void saveRatingF1(double ratingF1) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setDouble('ratingF1', ratingF1);
}
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isvisibleF1,
      child: Container(
        alignment: Alignment.bottomCenter,
        color: Colors.black45,
        height: 224,
        width: 400,
        child: Center(
          child: Column(
            children: [
                Text('Sua Avaliação (De 1 a 10) Avaliação = $_ratingF1',
              style: const TextStyle(color: Colors.blue),),
              const SizedBox(
                height: 5,
              ),
              const Text('Clube da Luta'),
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
                        _ratingF1 = index + 1;
                       for (int i = 0; i < isSelectedF1.length; i++) {
                              isSelectedF1[i] = i <= index;
                            }
                          });
                        },
                        icon:  Icon(
                          isSelectedF1[index]
                          ? Icons.star
                          : Icons.star_border,
                      color: isSelectedF1[index] ? Colors.yellow : null,),
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
                  saveRatingF1(_ratingF1);
                  setState(() {
                    _ratingF1 = _ratingF1;
                    //saveRatingBer(ratingBer);
                    isvisibleF1 = false;
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

class ImgAvlF2 extends StatefulWidget {
  
  const ImgAvlF2({super.key});

  @override
  State<ImgAvlF2> createState() => _ImgAvlF2State();
}


class _ImgAvlF2State extends State<ImgAvlF2> {
String avlF2 = '';
bool isvisibleF2 = true;
List<bool> isSelectedF2 = List.generate(10, (index) => false);
late double _ratingF2 = 0.0;




void saveRatingF2(double ratingF2) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setDouble('ratingF2', ratingF2);
}
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isvisibleF2,
      child: Container(
        alignment: Alignment.bottomCenter,
        color: Colors.black45,
        height: 224,
        width: 400,
        child: Center(
          child: Column(
            children: [
                Text('Sua Avaliação (De 1 a 10) Avaliação = $_ratingF2',
              style: const TextStyle(color: Colors.blue),),
              const SizedBox(
                height: 5,
              ),
              const Text('Garota Exemplar'),
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
                        _ratingF2 = index + 1;
                       for (int i = 0; i < isSelectedF2.length; i++) {
                              isSelectedF2[i] = i <= index;
                            }
                          });
                        },
                        icon:  Icon(
                          isSelectedF2[index]
                          ? Icons.star
                          : Icons.star_border,
                      color: isSelectedF2[index] ? Colors.yellow : null,),
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
                  saveRatingF2(_ratingF2);
                  setState(() {
                    _ratingF2 = _ratingF2;
                    //saveRating(rating);
                    isvisibleF2 = false;
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

class ImgAvlF3 extends StatefulWidget {
  
  const ImgAvlF3({super.key});

  @override
  State<ImgAvlF3> createState() => _ImgAvlF3State();
}


class _ImgAvlF3State extends State<ImgAvlF3> {
String avlF3 = '';
bool isvisibleF3 = true;
List<bool> isSelectedF3 = List.generate(10, (index) => false);
late double _ratingF3 = 0.0;




void saveRatingF3(double ratingF3) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setDouble('ratingF3', ratingF3);
}
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isvisibleF3,
      child: Container(
        alignment: Alignment.bottomCenter,
        color: Colors.black45,
        height: 224,
        width: 400,
        child: Center(
          child: Column(
            children: [
                Text('Sua Avaliação (De 1 a 10) Avaliação = $_ratingF3',
              style: const TextStyle(color: Colors.blue),),
              const SizedBox(
                height: 5,
              ),
              const Text('Gênio Indomável'),
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
                        _ratingF3 = index + 1;
                       for (int i = 0; i < isSelectedF3.length; i++) {
                              isSelectedF3[i] = i <= index;
                            }
                          });
                        },
                        icon:  Icon(
                          isSelectedF3[index]
                          ? Icons.star
                          : Icons.star_border,
                      color: isSelectedF3[index] ? Colors.yellow : null,),
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
                  saveRatingF3(_ratingF3);
                  setState(() {
                    _ratingF3 = _ratingF3;
                    //saveRating(rating);
                    isvisibleF3 = false;
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

class ImgAvlF4 extends StatefulWidget {
  
  const ImgAvlF4({super.key});

  @override
  State<ImgAvlF4> createState() => _ImgAvlF4State();
}


class _ImgAvlF4State extends State<ImgAvlF4> {
String avlF4 = '';
bool isvisibleF4 = true;
List<bool> isSelectedF4 = List.generate(10, (index) => false);
late double _ratingF4 = 0.0;




void saveRatingF4(double ratingF4) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setDouble('ratingF4', ratingF4);
}
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isvisibleF4,
      child: Container(
        alignment: Alignment.bottomCenter,
        color: Colors.black45,
        height: 224,
        width: 400,
        child: Center(
          child: Column(
            children: [
                Text('Sua Avaliação (De 1 a 10) Avaliação = $_ratingF4',
              style: const TextStyle(color: Colors.blue),),
              const SizedBox(
                height: 5,
              ),
              const Text('Gigantes de Aço'),
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
                        _ratingF4 = index + 1;
                       for (int i = 0; i < isSelectedF4.length; i++) {
                              isSelectedF4[i] = i <= index;
                            }
                          });
                        },
                        icon:  Icon(
                          isSelectedF4[index]
                          ? Icons.star
                          : Icons.star_border,
                      color: isSelectedF4[index] ? Colors.yellow : null,),
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
                  saveRatingF4(_ratingF4);
                  setState(() {
                    _ratingF4 = _ratingF4;
                    //saveRating(rating);
                    isvisibleF4 = false;
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

class ImgAvlF5 extends StatefulWidget {
  
  const ImgAvlF5({super.key});

  @override
  State<ImgAvlF5> createState() => _ImgAvlF5State();
}


class _ImgAvlF5State extends State<ImgAvlF5> {
String avlF5 = '';
bool isvisibleF5 = true;
List<bool> isSelectedF5 = List.generate(10, (index) => false);
late double _ratingF5 = 0.0;




void saveRatingF5(double ratingF5) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setDouble('ratingF5', ratingF5);
}
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isvisibleF5,
      child: Container(
        alignment: Alignment.bottomCenter,
        color: Colors.black45,
        height: 224,
        width: 400,
        child: Center(
          child: Column(
            children: [
                Text('Sua Avaliação (De 1 a 10) Avaliação = $_ratingF5',
              style: const TextStyle(color: Colors.blue),),
              const SizedBox(
                height: 5,
              ),
              const Text('Mulher Rei'),
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
                        _ratingF5 = index + 1;
                       for (int i = 0; i < isSelectedF5.length; i++) {
                              isSelectedF5[i] = i <= index;
                            }
                          });
                        },
                        icon:  Icon(
                          isSelectedF5[index]
                          ? Icons.star
                          : Icons.star_border,
                      color: isSelectedF5[index] ? Colors.yellow : null,),
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
                  saveRatingF5(_ratingF5);
                  setState(() {
                    _ratingF5 = _ratingF5;
                    //saveRating(rating);
                    isvisibleF5 = false;
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

class ImgAvlF6 extends StatefulWidget {
  
  const ImgAvlF6({super.key});

  @override
  State<ImgAvlF6> createState() => _ImgAvlF6State();
}


class _ImgAvlF6State extends State<ImgAvlF6> {
String avlF6 = '';
bool isvisibleF6 = true;
List<bool> isSelectedF6 = List.generate(10, (index) => false);
late double _ratingF6 = 0.0;




void saveRatingF6(double ratingF6) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setDouble('ratingF6', ratingF6);
}
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isvisibleF6,
      child: Container(
        alignment: Alignment.bottomCenter,
        color: Colors.black45,
        height: 224,
        width: 400,
        child: Center(
          child: Column(
            children: [
                Text('Sua Avaliação (De 1 a 10) Avaliação = $_ratingF6',
              style: const TextStyle(color: Colors.blue),),
              const SizedBox(
                height: 5,
              ),
              const Text('Psicopata Americano'),
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
                        _ratingF6 = index + 1;
                       for (int i = 0; i < isSelectedF6.length; i++) {
                              isSelectedF6[i] = i <= index;
                            }
                          });
                        },
                        icon:  Icon(
                          isSelectedF6[index]
                          ? Icons.star
                          : Icons.star_border,
                      color: isSelectedF6[index] ? Colors.yellow : null,),
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
                  saveRatingF6(_ratingF6);
                  setState(() {
                    _ratingF6 = _ratingF6;
                    //saveRating(rating);
                    isvisibleF6 = false;
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

class ImgAvlF7 extends StatefulWidget {
  
  const ImgAvlF7({super.key});

  @override
  State<ImgAvlF7> createState() => _ImgAvlF7State();
}


class _ImgAvlF7State extends State<ImgAvlF7> {
String avlF7 = '';
bool isvisibleF7 = true;
List<bool> isSelectedF7 = List.generate(10, (index) => false);
late double _ratingF7 = 0.0;




void saveRatingF7(double ratingF7) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setDouble('ratingF7', ratingF7);
}
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isvisibleF7,
      child: Container(
        alignment: Alignment.bottomCenter,
        color: Colors.black45,
        height: 224,
        width: 400,
        child: Center(
          child: Column(
            children: [
                Text('Sua Avaliação (De 1 a 10) Avaliação = $_ratingF7',
              style: const TextStyle(color: Colors.blue),),
              const SizedBox(
                height: 5,
              ),
              const Text('Questão de Tempo'),
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
                        _ratingF7 = index + 1;
                       for (int i = 0; i < isSelectedF7.length; i++) {
                              isSelectedF7[i] = i <= index;
                            }
                          });
                        },
                        icon:  Icon(
                          isSelectedF7[index]
                          ? Icons.star
                          : Icons.star_border,
                      color: isSelectedF7[index] ? Colors.yellow : null,),
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
                  saveRatingF7(_ratingF7);
                  setState(() {
                    _ratingF7 = _ratingF7;
                    //saveRating(rating);
                    isvisibleF7 = false;
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

class ImgAvlF8 extends StatefulWidget {
  
  const ImgAvlF8({super.key});

  @override
  State<ImgAvlF8> createState() => _ImgAvlF8State();
}


class _ImgAvlF8State extends State<ImgAvlF8> {
String avlF8 = '';
bool isvisibleF8 = true;
List<bool> isSelectedF8 = List.generate(10, (index) => false);
late double _ratingF8 = 0.0;




void saveRatingF8(double ratingF8) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setDouble('ratingF8', ratingF8);
}
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isvisibleF8,
      child: Container(
        alignment: Alignment.bottomCenter,
        color: Colors.black45,
        height: 224,
        width: 400,
        child: Center(
          child: Column(
            children: [
                Text('Sua Avaliação (De 1 a 10) Avaliação = $_ratingF8',
              style: const TextStyle(color: Colors.blue),),
              const SizedBox(
                height: 5,
              ),
              const Text('Simplesmente Acontece'),
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
                        _ratingF8 = index + 1;
                       for (int i = 0; i < isSelectedF8.length; i++) {
                              isSelectedF8[i] = i <= index;
                            }
                          });
                        },
                        icon:  Icon(
                          isSelectedF8[index]
                          ? Icons.star
                          : Icons.star_border,
                      color: isSelectedF8[index] ? Colors.yellow : null,),
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
                  saveRatingF8(_ratingF8);
                  setState(() {
                    _ratingF8 = _ratingF8;
                    //saveRating(rating);
                    isvisibleF8 = false;
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

class ImgAvlF9 extends StatefulWidget {
  
  const ImgAvlF9({super.key});

  @override
  State<ImgAvlF9> createState() => _ImgAvlF9State();
}


class _ImgAvlF9State extends State<ImgAvlF9> {
String avlF9 = '';
bool isvisibleF9 = true;
List<bool> isSelectedF9 = List.generate(10, (index) => false);
late double _ratingF9 = 0.0;




void saveRatingF9(double ratingF9) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setDouble('ratingF9', ratingF9);
}
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isvisibleF9,
      child: Container(
        alignment: Alignment.bottomCenter,
        color: Colors.black45,
        height: 224,
        width: 400,
        child: Center(
          child: Column(
            children: [
                Text('Sua Avaliação (De 1 a 10) Avaliação = $_ratingF9',
              style: const TextStyle(color: Colors.blue),),
              const SizedBox(
                height: 5,
              ),
              const Text('Tropa de Elite'),
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
                        _ratingF9 = index + 1;
                       for (int i = 0; i < isSelectedF9.length; i++) {
                              isSelectedF9[i] = i <= index;
                            }
                          });
                        },
                        icon:  Icon(
                          isSelectedF9[index]
                          ? Icons.star
                          : Icons.star_border,
                      color: isSelectedF9[index] ? Colors.yellow : null,),
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
                  saveRatingF9(_ratingF9);
                  setState(() {
                    _ratingF9 = _ratingF9;
                    //saveRating(rating);
                    isvisibleF9 = false;
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




