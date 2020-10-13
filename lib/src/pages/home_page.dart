import 'package:barberia/src/pages/caballeros_page.dart';
import 'package:barberia/src/pages/damas_page.dart';
import 'package:barberia/src/pages/inicio_page.dart';
import 'package:barberia/src/pages/ninios_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: _callPage(currentIndex),
      bottomNavigationBar: _crearBottonNavigationBar(context),
    );
  }

  Widget _callPage(int paginaActual) {
  
  switch( paginaActual ) {

    case 0: return InicioPage();
    case 1: return CaballerosPage();
    case 2: return DamasPage();
    case 3: return NiniosPage();

    default:
      return CaballerosPage();
  }
 }

 Widget _crearBottonNavigationBar(BuildContext context) {
  return Theme(
    data: Theme.of(context).copyWith(
      canvasColor: Color(0xFF444444),
    ),
      child: BottomNavigationBar(
      fixedColor: Colors.brown,
      
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/ic_home.png'),
            
          ),
          title: Text('Home')
          ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/ic_caballeros.png'),
            
          ),
          title: Text('Caballeros')
          ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/ic_damas.png'),
           
          ),
          title: Text('Damas')
          ),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage('assets/ic_ninos.png'),
            
          ),
          title: Text('Niños')
          ),  
      ],
    ),
  );
}
}