import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

import 'package:barberia/src/bloc/validators.dart';

class ReservaBasicaBloc with Validators {

 final _nombreController = BehaviorSubject<String>();
 final _apellidoController = BehaviorSubject<String>();
 final _celularController = BehaviorSubject<String>();
 final _sucursalController = BehaviorSubject<String>();
 final _fechaController = BehaviorSubject<String>();
 final _horaController = BehaviorSubject<String>();

 //Recuperar datos del stream
 Stream<String> get nombreStream => _nombreController.stream;
 Stream<String> get apellidoStream => _apellidoController.stream;
 Stream<String> get celularStream => _celularController.stream.transform(validarCelular);
 Stream<String> get sucursalStream => _sucursalController.stream;
 Stream<String> get fechaStream => _fechaController.stream;
 Stream<String> get horaStream => _horaController.stream;

 Stream<bool> get formValidStream => Rx.combineLatest6(nombreStream, apellidoStream, celularStream, _sucursalController, fechaStream, horaStream, (a, b, c, d, e, f) => true);

 //Insertar valores al Stream
  Function(String) get changeNombre   => _nombreController.sink.add;
  Function(String) get changeApellido => _apellidoController.sink.add;
  Function(String) get changeCelular  => _celularController.sink.add;
  Function(String) get changeSucursal => _sucursalController.sink.add;
  Function(String) get changeFecha    => _fechaController.sink.add;
  Function(String) get changeHora     => _horaController.sink.add;

  //Obtener el ultimo valor ingresado a los streams
  String get nombre   => _nombreController.value;
  String get apellido => _apellidoController.value;
  String get celular  => _celularController.value;
  String get sucursal => _sucursalController.value;
  String get fecha    => _fechaController.value;
  String get hora     => _horaController.value;

  void formularioCorrecto(String name, String lastname, String phone, String local, String date, String hour) {

    name = nombre;
    lastname = apellido;
    phone = celular;
    local = sucursal;
    date = fecha;
    hour = hora;
  }

  dispose() {
    _nombreController.close();
    _apellidoController.close();
    _celularController.close();
    _sucursalController.close();
    _fechaController.close();
    _horaController.close();
  
  }
}






