import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:barberia/src/utils/mailer.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';

import 'package:barberia/src/helpers/alerts.dart';
import 'package:barberia/src/models/reserva_basica_model.dart';
import 'package:barberia/src/bloc/provider.dart';
import 'package:barberia/src/bloc/reserva_basica_bloc.dart';
import 'package:barberia/src/utils/colofondo_utils.dart';

class ReservaDeliveryPage extends StatefulWidget {
  
  @override
  _ReservaDeliveryPageState createState() => _ReservaDeliveryPageState();
}

class _ReservaDeliveryPageState extends State<ReservaDeliveryPage> {
  TextEditingController reservaTipo = new TextEditingController();
  TextEditingController dateCtl = TextEditingController();
  TextEditingController timeCtl = TextEditingController();
  final formulario = new ReservaBasicaModel();
  DateTime selectedDate;
  TimeOfDay time;
  

  String _dropDownValue;
    List _sucursales = [
      'DCaballeros Viñedos', 'DCaballeros Bolichera'
    ];

  @override
  void initState() {
    reservaTipo.value = TextEditingValue(text: 'Reserva Normal');
    super.initState();
  }

  @override
  void dispose() {
    reservaTipo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final bloc = Provider.of(context);
    
    final ColorFondo args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: args.color,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   crearFondo(context),
                   SizedBox(height: 20.0,),
                   degradado(context),
                   SizedBox(height: 15.0,),
                   formularioReservaNombre('Nombres', bloc),
                   SizedBox(height: 15.0,),
                   formularioReservaApellidos('Apellidos', bloc),
                   SizedBox(height: 15.0,),
                   formularioReservaCelular('Celular', bloc),
                   SizedBox(height: 15.0,),
                   formularioReservaTipo('Tipo de reserva'),
                   SizedBox(height: 15.0,),
                   formularioReservaSurcursal('Sucursal', bloc),
                   SizedBox(height: 15.0,),
                   formularioReservaFecha('Fecha', bloc),
                   SizedBox(height: 15.0,),
                   formularioReservaHora('Hora', bloc),
                   SizedBox(height: 15.0,),
                   whatsappIcon(),
                   SizedBox(height: 15.0,),
                   botonReservar(bloc)
                  ],
                ),
              ],    
            ),
          ),
      ),
    );
  }

  Widget crearFondo(BuildContext context) {
    final ColorFondo args = ModalRoute.of(context).settings.arguments;
    final size = MediaQuery.of(context).size;
    final fondo = Container(
      width: double.infinity,
      height: size.height * 0.33,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(args.assetImg),
          fit: BoxFit.cover
        )
      ),
    );
    return Stack(
      children: [
        fondo,
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(top: 40.0),
          child: Image(
            height: 150.0,
            image: AssetImage('assets/logoblanco.png'),
          ),
        )
      ],
    );
  }

  Widget degradado(BuildContext context) {
    final ColorFondo args = ModalRoute.of(context).settings.arguments;
    final size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: size.height * 0.05,
      child: Text('Ingresa tus datos para separar tu cita'),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: args.degradado
        )
      ),
    );
  }

  Widget formularioReservaNombre(String texto, ReservaBasicaBloc bloc) {
    final ColorFondo args = ModalRoute.of(context).settings.arguments;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(texto, style: TextStyle( color: args.colorTexto, fontSize: 18) ),
          SizedBox(height: 5,),
          StreamBuilder(
            stream: bloc.nombreStream,
            builder: (BuildContext context,AsyncSnapshot snapshot) {
              return TextField(
                maxLines: 1,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  counterStyle: TextStyle(color: Colors.brown[400], fontSize: 10),
                  counterText: snapshot.data,
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Colors.transparent)
                  ),
                  enabledBorder: UnderlineInputBorder(      
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Colors.transparent),   
                  ),  
                  focusedBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),    
                ),
                onChanged: bloc.changeNombre,
              );
            }
          ),
        ],
      )
    );
  }

  Widget formularioReservaApellidos(String texto, ReservaBasicaBloc bloc) {
    final ColorFondo args = ModalRoute.of(context).settings.arguments;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(texto, style: TextStyle( color: args.colorTexto, fontSize: 18) ),
          SizedBox(height: 5,),
          StreamBuilder(
            stream: bloc.apellidoStream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return TextField(
                maxLines: 1,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  counterStyle: TextStyle(color: args.colorTexto, fontSize: 10),
                  counterText: snapshot.data,
                  errorText: snapshot.error,
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Colors.transparent)
                  ),
                  enabledBorder: UnderlineInputBorder(      
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Colors.transparent),   
                  ),  
                  focusedBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),   
                ),
                onChanged: bloc.changeApellido,
              );
            }
          ),
        ],
      )
    );
  }

  Widget formularioReservaCelular(String texto, ReservaBasicaBloc bloc) {
    final ColorFondo args = ModalRoute.of(context).settings.arguments;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(texto, style: TextStyle( color: args.colorTexto, fontSize: 18) ),
          SizedBox(height: 5,),
          StreamBuilder(
            stream: bloc.celularStream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return TextField(
                maxLines: 1,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  counterStyle: TextStyle(color: args.colorTexto, fontSize: 10),
                  counterText: snapshot.data,
                  errorText: snapshot.error,
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Colors.transparent)
                  ),
                  enabledBorder: UnderlineInputBorder(      
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Colors.transparent),   
                  ),  
                  focusedBorder: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(color: Colors.transparent),
                  ),     
                ),
                onChanged: bloc.changeCelular,
              );
            }
          ),
        ],
      )
    );
  }

  Widget formularioReservaTipo(String texto) {
    final ColorFondo args = ModalRoute.of(context).settings.arguments;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(texto, style: TextStyle( color: args.colorTexto, fontSize: 18) ),
          SizedBox(height: 5,),
          TextField(
            controller: reservaTipo,
            readOnly: true,
            style: TextStyle(color: Colors.black, fontSize: 16),
            decoration: InputDecoration(
              filled: true,
              fillColor: args.colorTexto,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
        ],
      )
    );
  }

  Widget formularioReservaSurcursal(String texto, ReservaBasicaBloc bloc) {
    final ColorFondo args = ModalRoute.of(context).settings.arguments;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(texto, style: TextStyle( color: args.colorTexto, fontSize: 18) ),
          SizedBox(height: 5,),
          StreamBuilder(
            stream: bloc.sucursalStream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return Container(
                padding: EdgeInsets.only(left:16, right: 16),
                decoration: BoxDecoration( borderRadius: BorderRadius.circular(30), color: Colors.white),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    hint: Text('Selecciona tu sucursal', style: TextStyle( fontSize: 16) ),
                    iconSize: 30.0,
                    isExpanded: true,
                    value: _dropDownValue,
                    onChanged: (value) {
                      setState(
                        () {
                          _dropDownValue = value;
                          bloc.changeSucursal;
                        });
                    },
                    items: _sucursales.map((value) {
                      return DropdownMenuItem(
                        child: Text(value),
                        value: value,
                      );
                    }).toList(),
                  ),
                ),
              );
            }
          ) 
        ],
      )
    );
  }

  Widget formularioReservaFecha(String texto, ReservaBasicaBloc bloc) {
    final ColorFondo args = ModalRoute.of(context).settings.arguments;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(texto, style: TextStyle( color: args.colorTexto, fontSize: 18) ),
          SizedBox(height: 5,),
          StreamBuilder(
              stream: bloc.fechaStream,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return Container(
                padding: EdgeInsets.only(left:16, right: 16),
                decoration: BoxDecoration( color: Colors.white, borderRadius: BorderRadius.circular(30)),
                child: TextField(
                  readOnly: true,
                  controller: dateCtl,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(      
                      borderSide: BorderSide(color: Colors.transparent),   
                    ),  
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),  
                    counterStyle: TextStyle(color: Colors.brown[400], fontSize: 10),
                    counterText: snapshot.data,
                    errorText: snapshot.error,
                    hintText: "Seleccionar",), 
                    onTap: () async{
                      DateTime date = DateTime(1900);
                      FocusScope.of(context).requestFocus(new FocusNode());

                      date = await showDatePicker(
                        
                        context: context, 
                        initialDate:DateTime.now().toLocal(),
                        firstDate:DateTime(1900),
                        lastDate: DateTime(2100));
                      if(date == null){
                      print("Cancelado");
                      } else {
                        final fechacompleta = ('${date.day}/${date.month}/${date.year}');
                        dateCtl.text = fechacompleta.toString();
                      }
                    },
                  onChanged: bloc.changeFecha,
                )
              );
            }
          ),
        ],
      )
    );
  }

  Widget formularioReservaHora(String texto, ReservaBasicaBloc bloc) {
    final ColorFondo args = ModalRoute.of(context).settings.arguments;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(texto, style: TextStyle( color: args.colorTexto, fontSize: 18) ),
          SizedBox(height: 5,),
          StreamBuilder(
            stream: bloc.horaStream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return Container(
                padding: EdgeInsets.only(left:16, right: 16),
                decoration: BoxDecoration( color: Colors.white, borderRadius: BorderRadius.circular(30)),
                child: TextField(
                  readOnly: true,
                  controller: timeCtl,
                  decoration: InputDecoration(
                    counterStyle: TextStyle(color: Colors.brown[400], fontSize: 10),
                    counterText: snapshot.data,
                    enabledBorder: UnderlineInputBorder(      
                      borderSide: BorderSide(color: Colors.transparent),   
                    ),  
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),  
                    errorText: snapshot.error,
                    hintText: "Seleccionar",), 
                    onTap: () async{
                  
                      FocusScope.of(context).requestFocus(new FocusNode());

                      TimeOfDay t = await showTimePicker(
                        
                        context: context, 
                        initialTime: TimeOfDay.now()
                        );
                        if(t == null){
                        print("Cancelado");
                        } else {
                        timeCtl.text = t.format(context).toString();
  
                        }
                        
                    },
                  onChanged: bloc.changeHora,
                ),
              );
            }
          )
        ],
      )
    );
  }

  Widget whatsappIcon() {
    final ColorFondo args = ModalRoute.of(context).settings.arguments;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('O reserva una cita vía WhatsApp', style: TextStyle(color: args.colorTexto, fontSize: 18) ),
          Container(
            width: 100,
            height: 100,
            child: FlatButton(
              onPressed: () {
                FlutterOpenWhatsapp.sendSingleMessage('+51931655938', 'Hola');
              },
              child: Image.asset('assets/whatsappiconreserva.png'),
            ),
          )
        ],
      ),
    );
  }

  Widget botonReservar(ReservaBasicaBloc bloc) {
    final size = MediaQuery.of(context).size;
    final ColorFondo args = ModalRoute.of(context).settings.arguments;
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: FlatButton(
            onPressed: snapshot.hasData ? () => _crearCita(bloc, context) : null,
            child: Container(
              width: double.infinity,
              height: size.height * 0.07,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: args.colorTexto
              ),
              child: Center(child: Text('Enviar', style: TextStyle(color: Colors.white, fontSize: 28),)),
            ),
          ),
        );
      }
    );
  }

  _crearCita(ReservaBasicaBloc bloc, BuildContext context) async {
    final mensaje = sendMail('${bloc.nombre}','${bloc.apellido}','${bloc.celular}','${reservaTipo.text}','$_dropDownValue','${dateCtl.text}','${timeCtl.text}',);
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      mostrarAlerta(context, 'No tienes internet', 'Verifica tu conexión a Internet', () => Navigator.pop(context));
    } else if(result == ConnectivityResult.mobile) {
      mostrarAlerta(context, 'Reserva realizada!', 'Tu reserva ha sido realizada con éxito!', () => Navigator.pushReplacementNamed(context, 'prereserva'));
      return mensaje;

    } else if (result == ConnectivityResult.wifi) {
      mostrarAlerta(context, 'Reserva realizada!', 'Tu reserva ha sido realizada con éxito!', () => Navigator.pushReplacementNamed(context, 'prereserva'));
      return mensaje;
    }
  }

}