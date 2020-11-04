import 'package:barberia/src/utils/colofondo_utils.dart';
import 'package:flutter/material.dart';

import 'package:barberia/src/widgets/widgets.dart';


class PreReservaNinoPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(236, 250, 255, 1.0),
        body: SafeArea(
         child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'reservabasica', arguments: ColorFondo(Color.fromRGBO(236, 250, 255, 1.0), 'assets/bannerreservacab.png', [Color.fromRGBO(77, 156, 208, 1.0), Color.fromRGBO(236, 250, 255, 1.0)], Color.fromRGBO(54, 124, 146, 1.0))),
                child: preReserva(context, AssetImage('assets/prereservaninnormal.png'), 'Reserva Basica', AssetImage('assets/icon_prereservaninnormal.png'), 'Podrás reservar un día y hora para poder visitar uno de nuestro locales D\'Caballeros y gozar de nuestros servicios sin esperas.', Colors.black)
                ),
              SizedBox(height: 20.0,),
              GestureDetector(
                onTap: () {},
                child: preReserva(context, AssetImage('assets/prereservanindelivery.png'), 'Reserva Delivery', AssetImage('assets/icon_delivery_preservacab.png'), 'Podrás reservar un día y hora para que uno de nuestros barberos te haga una visita y puedas gozar de nuestros servicios desde la comodidad de tu casa.', Colors.black)
                ),
              SizedBox(height: 20.0,),
              GestureDetector(
                onTap: () {},
                child: preReserva(context, AssetImage('assets/prereservaninpremium.png'), 'Reserva Premium', AssetImage('assets/icon_premium_prereservacab.png'), 'Dejanos todo a nosotros!, te recogeremos el día y a la hora que desees para llevarte a uno de nuestros locales y seas atendido sin esperas.', Colors.black)
                ),

            ],
          ),
        ),
      ),
    );
  }

    
  
}