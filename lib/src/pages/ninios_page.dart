import 'package:flutter/material.dart';

import 'package:barberia/src/widgets/widgets.dart';



class NiniosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FlatButton(
        child: Container(  
          decoration: BoxDecoration(
            color: Color.fromRGBO(77, 156, 208, 1.0),
            borderRadius: BorderRadius.circular(30.0)
          ),
          padding: EdgeInsets.symmetric(horizontal:45.0, vertical: 15.0),
          child: Text('RESERVAR', style: TextStyle(color: Colors.white, fontSize: 20.0))),
        onPressed: () => Navigator.pushNamed(context, 'prereservanino')),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromRGBO(236, 250, 255, 1.0)
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
                    child: Text('D\'NIÑOS', style: TextStyle(color: Color.fromRGBO(77, 156, 208, 1.0),fontSize: 20.0),),
                  ),
                  degradadoWidget(context, 'Cortes', [Color.fromRGBO(77, 156, 208, 1.0), Color.fromRGBO(236, 250, 255, 1.0)], Colors.white),
                  SizedBox(height: 15.0),
                  rowCortes(AssetImage('assets/corte1nin.png'), AssetImage('assets/corte2nin.png'), AssetImage('assets/corte3nin.png')
                  ),
                  SizedBox(height: 25.0),
                  rowCortes(AssetImage('assets/corte4nin.png'), AssetImage('assets/corte5nin.png'), AssetImage('assets/corte6nin.png')
                  ),
                  SizedBox(height: 15.0),
                  degradadoWidget(context, 'Servicios', [Color.fromRGBO(77, 156, 208, 1.0), Color.fromRGBO(236, 250, 255, 1.0)], Colors.white),
                  Container(
                    padding: EdgeInsets.only(bottom: 15.0),
                    child: Text('Te brindamos:', style: TextStyle(color:Color.fromRGBO(54, 124, 146, 1.0),fontSize: 23.0),
                    ),
                  ),
                  serviciosNinos(context),
                  SizedBox(height: 20.0,),
                  carrusel(
                   AssetImage('assets/carrousel1nin.jpg'), AssetImage('assets/carrousel2nin.jpg'), 
                   AssetImage('assets/carrousel3nin.jpg'), AssetImage('assets/carrousel4nin.jpg'), 
                   AssetImage('assets/carrousel5nin.jpg'), AssetImage('assets/carrousel6nin.jpg'), 
                   AssetImage('assets/carrousel7nin.jpg')
                   ),
                   SizedBox(height: 20.0,),
                   Container(
                     height: 100,
                     color: Color.fromRGBO(236, 250, 255, 1.0)
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