import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import "package:latlong/latlong.dart" as latLng;

import 'package:barberia/src/widgets/widgets.dart';

class InicioPage extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF444444),
        title: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 35,maxWidth: 100),
          child: Image.asset('assets/logoblanco.png')
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                degradadoWidget(context, 'NOSOTROS',  [
                Color(0xFF444444),
                Colors.black
                ], Colors.brown[400]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 18.0 ),
                      width: size.width * 0.45,
                      height: size.height * 0.35,
                      child: Text('Barberia Dcaballeros con más de 5 años de experiencia  brindando un excelente servicio y preocupándonos por cada detalle, porque no es solo un corte, es asesorarte para que te vayas feliz con el servicio brindado.', style: TextStyle(color: Colors.white, fontSize: 15),)
                      ),
                    Container(
                      width: size.width * 0.45,
                      height: size.height * 0.35,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/portada.jpeg')
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                degradadoWidget(context, 'HORARIOS DE ATENCIÓN',  [
                  Color(0xFF444444),
                  Colors.black
                ], Colors.brown[400]),
                horario(context),
                degradadoWidget(context, 'SUCURSALES',  [
                  Color(0xFF444444),
                  Colors.black
                ], Colors.brown[400]),
                sucursal(context),
                SizedBox(
                  height: 40.0,
                ),
                mapa(context),
                iconos(),
                SizedBox(
                  height: 20.0,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget horario(BuildContext context) {
    final String someText = 
                            "Lunes a Sábados:\n\n"
                            "11:00 a.m. - 10:00 p.m.\n\n"
                            "Domingos:\n\n"
                            "12:00 a.m. - 9:00 p.m.\n\n";
    final size = MediaQuery.of(context).size;
    return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 18.0 ),
                      width: size.width * 0.45,
                      height: size.height * 0.30,
                      child: Text(someText, style: TextStyle(color: Colors.white, fontSize: 15),
                       ),
                      ),
                    Container(
                      width: size.width * 0.45,
                      height: size.height * 0.30,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          alignment: Alignment.topCenter,
                          image: AssetImage('assets/iconhorario.png')
                        ),
                      ),
                    )
                  ],
                );
  }
  Widget sucursal(context) {
    final String someText = 
                            "Contamos con 2 locales:\n\n"
                            "Av. Los Proceres Cuadra 5 Urb. Sanchez Cerro Surco, frente al ICPNA.\n\n"
                            "Av. Los Próceres Cuadra 12, Surco.\n\n";
    final size = MediaQuery.of(context).size;
   return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: size.width * 0.45,
                      height: size.height * 0.30,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/iconsucursal.png')
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(left: 18.0 ),
                      width: size.width * 0.45,
                      height: size.height * 0.30,
                      child: Text(someText, style: TextStyle(color: Colors.white, fontSize: 15),
                       ),
                      ),
                  ],
                );
  }
  Widget mapa(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.90,
      height: 200.0,
      child: FlutterMap(
        options: MapOptions(
          center: latLng.LatLng(-12.162187,-76.990081),
          zoom: 18, 
        ),
        layers: [
          _crearMapa(),
          MarkerLayerOptions(
        markers: [
          new Marker(
            width: 80.0,
            height: 80.0,
            point: latLng.LatLng(-12.162187,-76.990081),
            builder: (ctx) =>
            new Container(
              child: Icon(
             Icons.location_on, 
             size: 60.0,
             color: Theme.of(context).primaryColor,),
            ),
          ),
        ],
       ),
      ]
    ) 
   );
  }
  _crearMapa() {
   return TileLayerOptions(
      urlTemplate: 'https://api.mapbox.com/v4/'
      '{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
      additionalOptions: {
        'accessToken': 'pk.eyJ1Ijoia2xlcml0aCIsImEiOiJjanY2MjF4NGIwMG9nM3lvMnN3ZDM1dWE5In0.0SfmUpbW6UFj7ZnRdRyNAw',
        'id': 'mapbox.streets'
      }
    );
 }
  Widget iconos() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: EdgeInsets.all(30.0),
          child: GestureDetector(
            onTap: () {}, // handle your image tap here
            child: Image.asset(
              'assets/fbicon.png',
              fit: BoxFit.cover, // this is the solution for border
              width: 60.0,
              height: 60.0,
            ),
          )
        ),
        Container(
          padding: EdgeInsets.all(30.0),
          child: GestureDetector(
            onTap: () {}, // handle your image tap here
            child: Image.asset(
              'assets/fbinstagram.png',
              fit: BoxFit.cover, // this is the solution for border
              width: 60.0,
              height: 60.0,
            ),
          )
        ),
      ],
    );
  }

}