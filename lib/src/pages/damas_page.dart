import 'package:flutter/material.dart';

import 'package:barberia/src/widgets/widgets.dart';



class DamasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FlatButton(
        child: Container(  
          decoration: BoxDecoration(
            color: Color.fromRGBO(62, 66, 102, 1.0),
            borderRadius: BorderRadius.circular(30.0)
          ),
          padding: EdgeInsets.symmetric(horizontal:45.0, vertical: 15.0),
          child: Text('RESERVAR', style: TextStyle(color: Colors.white, fontSize: 20.0))),
        onPressed: () =>Navigator.pushNamed(context, 'prereservadama')),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromRGBO(230, 232, 255, 1.0)
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
                    child: Text('D\'CABELLOS', style: TextStyle(color: Color.fromRGBO(62, 66, 102, 1.0),fontSize: 20.0),),
                  ),
                  degradadoWidget(context, 'Peinados', [Color.fromRGBO(62, 66, 102, 1.0), Color.fromRGBO(230, 232, 255, 1.0)], Colors.white),
                  SizedBox(height: 15.0),
                  rowCortes(AssetImage('assets/peinado1.png'), AssetImage('assets/peinado2.png'), AssetImage('assets/peinado3.png')
                  ),
                  SizedBox(height: 25.0),
                  rowCortes(AssetImage('assets/peinado4.png'), AssetImage('assets/peinado5.png'), AssetImage('assets/peinado6.png')
                  ),
                  SizedBox(height: 15.0),
                  degradadoWidget(context, 'Servicios', [Color.fromRGBO(62, 66, 102, 1.0), Color.fromRGBO(230, 232, 255, 1.0)], Colors.white),
                  Container(
                    padding: EdgeInsets.only(bottom: 15.0),
                    child: Text('Te brindamos:', style: TextStyle(color:Color.fromRGBO(62, 66, 102, 1.0),fontSize: 23.0),
                    ),
                  ),
                  serviciosDamas(context),
                  SizedBox(height: 20.0,),
                  carrusel(
                   AssetImage('assets/carrousel1dam.jpg'), AssetImage('assets/carrousel2dam.jpg'), 
                   AssetImage('assets/carrousel3dam.jpg'), AssetImage('assets/carrousel4dam.png'), 
                   AssetImage('assets/carrousel5dam.png'), AssetImage('assets/carrousel6dam.jpg'), 
                   AssetImage('assets/carrousel7dam.png')
                   ),
                   SizedBox(height: 20.0,),
                   degradadoWidget(context, 'Tatuajes', [Color.fromRGBO(62, 66, 102, 1.0), Color.fromRGBO(230, 232, 255, 1.0)], Colors.white),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 18.0),
                      width: size.width * 0.45,
                      height: size.height * 0.30,
                      child: Text('En nuestro mismo local disponemos de varias salas de tatuajes con los mejores tatuadores del país', style: TextStyle(color: Colors.indigo[300], fontSize: 16),)
                      ),
                    Container(
                      width: 180,
                      height: size.height * 0.25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/sillatatoo.png'),
                          fit: BoxFit.fitHeight
                        ),
                      ),
                    )
                     ],
                   ),
                   Container(
                     padding: EdgeInsets.all(25.0),
                     child: Text('EJEMPLOS DE TATUAJES',style:TextStyle(color: Color.fromRGBO(62, 66, 102, 1.0), fontSize:18.0)),
                   ),
                   Column(
                     children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           Container(
                             alignment: Alignment.topCenter,
                              width: size.width * 0.40,
                              height: size.height * 0.35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.0),
                                image: DecorationImage(
                                 fit: BoxFit.fill,
                                  image: AssetImage('assets/tatoo1dam.jpg')
                                ),
                              ),
                            ),
                           Container(
                             alignment: Alignment.topCenter,
                             padding: EdgeInsets.only(left: 15.0),
                              width: size.width * 0.40,
                              height: size.height * 0.35,
                              child: Text('Puedes utilizar las zonas más grandes de tu cuerpo, como la espalda y el pecho, de esa forma podrás plasmar un diseño a gran escala y el cual puedas dotar de colores y detalles',textAlign: TextAlign.left, style: TextStyle(color: Colors.indigo[300], fontSize: 14.5, ),)
                              ),
                         ],
                       ),
                       SizedBox(height: 20.0,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           Container(
                             alignment: Alignment.topCenter,
                             padding: EdgeInsets.only(left: 15.0),
                              width: size.width * 0.40,
                              height: size.height * 0.35,
                              child: Text('Este tipo de tatuajes es de gran utilización entre la población masculina a la hora de realizarse algún diseño, debido a que siempre han tenido gran popularidad.',textAlign: TextAlign.left, style: TextStyle(color: Colors.indigo[300], fontSize: 14.5, ),)
                              ),
                           Container(
                             alignment: Alignment.topCenter,
                              width: size.width * 0.40,
                              height: size.height * 0.35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.0),
                                image: DecorationImage(
                                 fit: BoxFit.fill,
                                  image: AssetImage('assets/tatoo2dam.jpg')
                                ),
                              ),
                            ),
                         ],
                       ),
                       SizedBox(height: 20.0,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           Container(
                             alignment: Alignment.topCenter,
                              width: size.width * 0.40,
                              height: size.height * 0.35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.0),
                                image: DecorationImage(
                                 fit: BoxFit.fill,
                                  image: AssetImage('assets/tatoo3dam.jpg')
                                ),
                              ),
                            ),
                           Container(
                             alignment: Alignment.topCenter,
                             padding: EdgeInsets.only(left: 15.0),
                              width: size.width * 0.40,
                              height: size.height * 0.35,
                              child: Text('Para tatuajes en el antebrazo puedes realizar diseños al estilo brazalete, así como también diseños de brújulas, flechas, aves, árboles o algún elemento que te identifique',textAlign: TextAlign.left, style: TextStyle(color: Colors.indigo[300], fontSize: 14, ),)
                              ),
                         ],
                       ),
                     ],
                   ),
                   Container(
                     height: 100,
                     color: Color.fromRGBO(230, 232, 255, 1.0)
                   )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}