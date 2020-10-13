part of 'widgets.dart';

Widget degradadoWidget(BuildContext context, String mensaje, List<Color> color, Color tColor) {
   final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: 15,bottom: 15),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
      child: Text(mensaje,style: TextStyle(color: tColor, fontSize: 20),),
      width: double.infinity,
      height: size.height * 0.08,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: color,
        )
      ),
    );
}