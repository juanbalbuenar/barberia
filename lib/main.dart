import 'package:flutter/material.dart';

import 'package:barberia/src/bloc/provider.dart';

import 'package:barberia/src/routes/routes.dart';

 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Barberia',
        initialRoute: 'home',
        routes: appRoutes
      ),
    );
  }
}