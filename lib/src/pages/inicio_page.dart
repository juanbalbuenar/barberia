import 'package:flutter/material.dart';
import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:barberia/src/widgets/widgets.dart';
import 'package:permission_handler/permission_handler.dart';

class InicioPage extends StatefulWidget {
  @override
  _InicioPageState createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  Completer<GoogleMapController> _controller = Completer();
  List<Marker> _markers = <Marker>[];

  void _location() async{
    final status = await Permission.location.request();
    print(status);
  }

  @override
  void initState() {
    _location();
    super.initState();
  }

  static final CameraPosition _cameraPosition = CameraPosition(
    target: LatLng(-12.162187,-76.990081),
    zoom: 14.4746,
  );

  

  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    _markers.add(
      Marker(
        markerId: MarkerId('Barberia'),
        position: LatLng(-12.162187,-76.990081),

      )
    );
    
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
      child: _crearMapa() 
   );
  }

  _crearMapa() {
   return GoogleMap(
     initialCameraPosition: _cameraPosition,
     markers: Set<Marker>.of(_markers),
     onMapCreated: (GoogleMapController controller) {
       _controller.complete(controller);
      },
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