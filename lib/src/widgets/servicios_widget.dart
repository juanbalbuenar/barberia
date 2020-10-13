part of 'widgets.dart';

Widget serviciosCaballero(BuildContext context,) {
    final size = MediaQuery.of(context).size;
    return Container(
                    height: size.height * 0.25,
                    width: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Text('Cortes',style: TextStyle(color:Colors.brown[100], fontSize: 17.0),
                          ),
                        ),
                        Container(
                          child: Text('Barbas',style: TextStyle(color:Colors.brown[100], fontSize: 17.0),
                          ),
                        ),
                        Container(
                          child: Text('Masajes',style: TextStyle(color:Colors.brown[100], fontSize: 17.0),
                          ),
                        ),
                        Container(
                          child: Text('Tatuajes',style: TextStyle(color:Colors.brown[100], fontSize: 17.0),
                          ),
                        ),
                        
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      gradient: LinearGradient(
                        begin: FractionalOffset(0.0, 0.4),
                        end: FractionalOffset(0.0, 1.0),
                        colors: [
                          Colors.brown,
                          Colors.black
                        ],
                      )
                    ),
                  );
  }

  Widget serviciosDamas(BuildContext context,) {
    final size = MediaQuery.of(context).size;
    return Container(
                    height: size.height * 0.25,
                    width: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Text('Tinte Completo',style: TextStyle(color:Color.fromRGBO(62, 66, 102, 1.0), fontSize: 17.0),
                          ),
                        ),
                        Container(
                          child: Text('Facial Completo',style: TextStyle(color:Color.fromRGBO(62, 66, 102, 1.0), fontSize: 17.0),
                          ),
                        ),
                        Container(
                          child: Text('Manicura',style: TextStyle(color:Color.fromRGBO(62, 66, 102, 1.0), fontSize: 17.0),
                          ),
                        ),
                        Container(
                          child: Text('Masajes',style: TextStyle(color:Color.fromRGBO(62, 66, 102, 1.0), fontSize: 17.0),
                          ),
                        ),
                        Container(
                          child: Text('Maquillaje',style: TextStyle(color:Color.fromRGBO(62, 66, 102, 1.0), fontSize: 17.0),
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      gradient: LinearGradient(
                        begin: FractionalOffset(0.0, 0.4),
                        end: FractionalOffset(0.0, 1.0),
                        colors: [
                          Colors.white,
                          Color.fromRGBO(230, 232, 255, 1.0)
                        ],
                      )
                    ),
                  );
  }

  Widget serviciosNinos(BuildContext context,) {
    final size = MediaQuery.of(context).size;
    return Container(
                    height: size.height * 0.25,
                    width: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Text('Cortes',style: TextStyle(color:Color.fromRGBO(77, 156, 208, 1.0), fontSize: 17.0),
                          ),
                        ),
                        Container(
                          child: Text('Masajes',style: TextStyle(color:Color.fromRGBO(77, 156, 208, 1.0), fontSize: 17.0),
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      gradient: LinearGradient(
                        begin: FractionalOffset(0.0, 0.4),
                        end: FractionalOffset(0.0, 1.0),
                        colors: [
                          Colors.white,
                          Color.fromRGBO(236, 250, 255, 1.0)
                        ],
                      )
                    ),
                  );
  }