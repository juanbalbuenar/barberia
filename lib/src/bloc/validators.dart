import 'dart:async';

class Validators {
  final validarNombre = StreamTransformer<String, String>.fromHandlers(
    handleData: (nombre, sink) {
       Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
       RegExp regExp   = new RegExp(pattern);

       if(regExp.hasMatch(nombre)) {
         sink.add(nombre);
       } else {
         sink.addError('El nombre no es valido');
       }
    },
  );

  final validarApellidos = StreamTransformer<String, String>.fromHandlers(
    handleData: (nombre, sink) {
       Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
       RegExp regExp   = new RegExp(pattern);

       if(regExp.hasMatch(nombre)) {
         sink.add(nombre);
       } else {
         sink.addError('Los apellidos no es valido');
       }
    },
  );

  final validarCelular = StreamTransformer<String, String>.fromHandlers(
    handleData: ( celular, sink) {
      if(celular.length >= 9) {
        sink.add(celular);
      }else {
        sink.addError('Mas de 8 caracteres por favor');
      }
    }
  );
  
}