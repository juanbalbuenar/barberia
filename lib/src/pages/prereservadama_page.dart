import 'package:flutter/material.dart';

import 'package:barberia/src/utils/colofondo_utils.dart';
import 'package:barberia/src/widgets/widgets.dart';

class PreReservaDamaPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(230, 232, 255, 1.0),
        body: SafeArea(
         child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'reservabasica', arguments: 
                  ColorFondo(Color.fromRGBO(230, 232, 255, 1.0), 
                  'assets/bannerreservadam.png', 
                  [Color.fromRGBO(62, 66, 102, 1.0), Color.fromRGBO(230, 232, 255, 1.0)],
                  Colors.indigo[300]
                  ) 
                ),
                child: preReserva(context, AssetImage('assets/prereservadamnormal.png'), 'Reserva Basica', AssetImage('assets/icon_normal_prereservadam.png'), 'Podrás reservar un día y hora para poder visitar uno de nuestro locales D\'Cabellos y gozar de nuestros servicios sin esperas.', Colors.black)
                ),
              SizedBox(height: 20.0,),
              GestureDetector(
                onTap: () {},
                child: preReserva(context, AssetImage('assets/prereservadamdelivery.png'), 'Reserva Delivery', AssetImage('assets/icon_delivery_preservacab.png'), 'Podrás reservar un día y hora para que uno de nuestros barberos te haga una visita y puedas gozar de nuestros servicios desde la comodidad de tu casa.', Colors.black)
                ),
              SizedBox(height: 20.0,),
              GestureDetector(
                onTap: () {},
                child: preReserva(context, AssetImage('assets/prereservadamprem.png'), 'Reserva Premium', AssetImage('assets/icon_premium_prereservacab.png'), 'Dejanos todo a nosotros!, te recogeremos el día y a la hora que desees para llevarte a uno de nuestros locales y seas atendido sin esperas.', Colors.black)
                ),

            ],
          ),
        ),
      ),
    );
  }

    
  
}