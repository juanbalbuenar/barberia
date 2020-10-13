import 'package:flutter/material.dart';

import 'package:barberia/src/pages/caballeros_page.dart';
import 'package:barberia/src/pages/damas_page.dart';
import 'package:barberia/src/pages/home_page.dart';
import 'package:barberia/src/pages/inicio_page.dart';
import 'package:barberia/src/pages/ninios_page.dart';
import 'package:barberia/src/pages/prereserva_page.dart';
import 'package:barberia/src/pages/prereservanino_page.dart';
import 'package:barberia/src/pages/reservabasica_page.dart';
import 'package:barberia/src/pages/prereservadama_page.dart';


final Map<String, Widget Function(BuildContext)> appRoutes = {

  'home'           : (BuildContext context) => HomePage(),
  'caballeros'     : (BuildContext context) => CaballerosPage(),
  'inicio'         : (BuildContext context) => InicioPage(),
  'damas'          : (BuildContext context) => DamasPage(),
  'ninios'         : (BuildContext context) => NiniosPage(),
  'prereserva'     : (BuildContext context) => PreReservaPage(),
  'prereservadama' : (BuildContext context) => PreReservaDamaPage(),
  'prereservanino' : (BuildContext context) => PreReservaNinoPage(),
  'reservabasica'  : (BuildContext context) => ReservaBasicaPage(),


};