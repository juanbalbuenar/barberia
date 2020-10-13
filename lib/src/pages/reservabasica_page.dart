import 'package:barberia/src/models/reserva_basica_model.dart';
import 'package:flutter/material.dart';
import 'package:barberia/src/bloc/provider.dart';
import 'package:barberia/src/utils/mailer.dart';

import 'package:barberia/src/bloc/reserva_basica_bloc.dart';
import 'package:barberia/src/utils/colofondo_utils.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';

class ReservaBasicaPage extends StatefulWidget {
  
  @override
  _ReservaBasicaPageState createState() => _ReservaBasicaPageState();
}

class _ReservaBasicaPageState extends State<ReservaBasicaPage> {
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
    final size = MediaQuery.of(context).size;
    final fondo = Container(
      width: double.infinity,
      height: size.height * 0.33,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/bannerreservacab.png'),
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
    final size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: size.height * 0.05,
      child: Text('Ingresa tus datos para separar tu cita'),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.brown[300],
            Colors.white
          ])
      ),
    );
  }

  Widget formularioReservaNombre(String texto, ReservaBasicaBloc bloc) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(texto, style: TextStyle( color: Colors.brown[400], fontSize: 18) ),
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
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(texto, style: TextStyle( color: Colors.brown[400], fontSize: 18) ),
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
                  counterStyle: TextStyle(color: Colors.brown[400], fontSize: 10),
                  counterText: snapshot.data,
                  errorText: snapshot.error,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(texto, style: TextStyle( color: Colors.brown[400], fontSize: 18) ),
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
                  counterStyle: TextStyle(color: Colors.brown[400], fontSize: 10),
                  counterText: snapshot.data,
                  errorText: snapshot.error,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(texto, style: TextStyle( color: Colors.brown[400], fontSize: 18) ),
          SizedBox(height: 5,),
          TextField(
            controller: reservaTipo,
            readOnly: true,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.brown[300],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 2.0,
                )
              ),
    
            ),
          ),
        ],
      )
    );
  }

  Widget formularioReservaSurcursal(String texto, ReservaBasicaBloc bloc) {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(texto, style: TextStyle( color: Colors.brown[400], fontSize: 18) ),
          SizedBox(height: 5,),
          StreamBuilder(
            stream: bloc.sucursalStream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return Container(
                padding: EdgeInsets.only(left:16, right: 16),
                decoration: BoxDecoration( borderRadius: BorderRadius.circular(30), color: Colors.white),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    hint: Text('Selecciona tu sucursal', style: TextStyle( fontSize: 18) ),
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

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(texto, style: TextStyle( color: Colors.brown[400], fontSize: 18) ),
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

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(texto, style: TextStyle( color: Colors.brown[400], fontSize: 18) ),
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('O reserva una cita vía WhatsApp', style: TextStyle(color: Colors.brown[400], fontSize: 18) ),
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

    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return FlatButton(
          onPressed: () {

            
            final info = bloc.formularioCorrecto(bloc.nombre, bloc.apellido, bloc.celular, bloc.sucursal, bloc.fecha, bloc.hora);
            
            

          }, 
          child: Container(
            width: double.infinity,
            height: size.height * 0.10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.brown[400]
            ),
            child: Center(child: Text('Enviar', style: TextStyle(color: Colors.white, fontSize: 28),)),
          ),
        );
      }
    );
  }

}

