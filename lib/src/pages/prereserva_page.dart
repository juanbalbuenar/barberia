import 'package:flutter/material.dart';

import 'package:barberia/src/widgets/widgets.dart';
import 'package:barberia/src/utils/colofondo_utils.dart';


class PreReservaPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        body: SafeArea(
         child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'reservabasica',arguments: ColorFondo(Colors.black)),
                child: preReserva(context, AssetImage('assets/imgreservanormal.png'), 'Reserva Normal', AssetImage('assets/iconreservanormalcab.png'), 'Podrás reservar un día y hora para poder visitar uno de nuestro locales D\'Caballeros y gozar de nuestros servicios sin esperas.', Colors.black)
                ),
              SizedBox(height: 20.0,),
              GestureDetector(
                onTap: () {},
                child: preReserva(context, AssetImage('assets/imgreservadel.png'), 'Reserva Delivery', AssetImage('assets/icon_delivery_preservacab.png'), 'Podrás reservar un día y hora para que uno de nuestros barberos te haga una visita y puedas gozar de nuestros servicios desde la comodidad de tu casa.', Colors.black)
                ),
              SizedBox(height: 20.0,),
              GestureDetector(
                onTap: () {},
                child: preReserva(context, AssetImage('assets/imgreservaprem.png'), 'Reserva Premium', AssetImage('assets/icon_premium_prereservacab.png'), 'Dejanos todo a nosotros!, te recogeremos el día y a la hora que desees para llevarte a uno de nuestros locales y seas atendido sin esperas.', Colors.black)
                ),

            ],
          ),
        ),
      ),
    );
  }

    
  
}