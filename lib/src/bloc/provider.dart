import 'package:flutter/material.dart';

import 'package:barberia/src/bloc/reserva_basica_bloc.dart';

class Provider extends InheritedWidget {

  final reservaBasicaBloc = ReservaBasicaBloc();

  static Provider _instancia;

  factory Provider({ Key key, Widget child}) {
    if( _instancia == null) {
      _instancia = new Provider._internal(key: key, child: child);
    }
    return _instancia;
  }

  Provider._internal({ Key key, Widget child})
    : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static ReservaBasicaBloc of (BuildContext context) {
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).reservaBasicaBloc;
  }  
}