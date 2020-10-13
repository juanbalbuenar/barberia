import 'package:flutter/material.dart';

import 'package:barberia/src/widgets/widgets.dart';



class CaballerosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FlatButton(
        child: Container(  
          decoration: BoxDecoration(
            color: Colors.brown,
            borderRadius: BorderRadius.circular(30.0)
          ),
          padding: EdgeInsets.symmetric(horizontal:45.0, vertical: 15.0),
          child: Text('RESERVAR', style: TextStyle(color: Colors.white, fontSize: 20.0))),
        onPressed: () => Navigator.pushNamed(context, 'prereserva')),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
                    child: Text('D\'CABALLEROS', style: TextStyle(color: Colors.brown[400],fontSize: 20.0),),
                  ),
                  degradadoWidget(context, 'Cortes', [Colors.brown[300], Colors.black], Colors.white),
                  SizedBox(height: 15.0),
                  rowCortes(AssetImage('assets/corte1.png'), AssetImage('assets/corte2.png'), AssetImage('assets/corte3.png')
                  ),
                  SizedBox(height: 25.0),
                  rowCortes(AssetImage('assets/corte4.png'), AssetImage('assets/corte5.png'), AssetImage('assets/corte6.png')
                  ),
                  SizedBox(height: 15.0),
                  degradadoWidget(context, 'Servicios', [Colors.brown[300], Colors.black], Colors.white),
                  Container(
                    padding: EdgeInsets.only(bottom: 15.0),
                    child: Text('Te brindamos:', style: TextStyle(color:Colors.brown[400],fontSize: 23.0),
                    ),
                  ),
                  serviciosCaballero(context),
                  SizedBox(height: 20.0,),
                  carrusel(
                   AssetImage('assets/carrousel1.jpg'), AssetImage('assets/carrousel2.jpg'), 
                   AssetImage('assets/carrousel3.jpg'), AssetImage('assets/carrousel4.jpg'), 
                   AssetImage('assets/carrousel5.jpg'), AssetImage('assets/carrousel6.jpg'), 
                   AssetImage('assets/carrousel7.jpg')
                   ),
                   SizedBox(height: 20.0,),
                   degradadoWidget(context, 'Tatuajes', [Colors.brown[300], Colors.black], Colors.white),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 18.0 ),
                      width: size.width * 0.45,
                      height: size.height * 0.30,
                      child: Text('En nuestro mismo local disponemos de varias salas de tatuajes con los mejores tatuadores del país', style: TextStyle(color: Colors.white, fontSize: 16),)
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
                     child: Text('EJEMPLOS DE TATUAJES',style:TextStyle(color: Colors.white, fontSize:18.0)),
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
                                  image: AssetImage('assets/tatoo1.png')
                                ),
                              ),
                            ),
                           Container(
                             alignment: Alignment.topCenter,
                             padding: EdgeInsets.only(left: 15.0),
                              width: size.width * 0.40,
                              height: size.height * 0.35,
                              child: Text('Puedes utilizar las zonas más grandes de tu cuerpo, como la espalda y el pecho, de esa forma podrás plasmar un diseño a gran escala y el cual puedas dotar de colores y detalles',textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontSize: 14.5, ),)
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
                              child: Text('Este tipo de tatuajes es de gran utilización entre la población masculina a la hora de realizarse algún diseño, debido a que siempre han tenido gran popularidad.',textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontSize: 14.5, ),)
                              ),
                           Container(
                             alignment: Alignment.topCenter,
                              width: size.width * 0.40,
                              height: size.height * 0.35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40.0),
                                image: DecorationImage(
                                 fit: BoxFit.fill,
                                  image: AssetImage('assets/tatoo2.png')
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
                                  image: AssetImage('assets/tatoo3.png')
                                ),
                              ),
                            ),
                           Container(
                             
                             alignment: Alignment.topCenter,
                             padding: EdgeInsets.only(left: 15.0),
                              width: size.width * 0.40,
                              height: size.height * 0.35,
                              child: Text('Para tatuajes en el antebrazo puedes realizar diseños al estilo brazalete, así como también diseños de brújulas, flechas, aves, árboles o algún elemento que te identifique.',textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontSize: 14, ),)
                              ),
                         ],
                       ),
                     ],
                   ),
                   Container(
                     height: 100,
                     color: Colors.black
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