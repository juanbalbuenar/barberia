part of 'widgets.dart';


Widget preReserva(BuildContext context, AssetImage imgfondo, String titulo, AssetImage icono, String descripcion, Color color)  {
    final size = MediaQuery.of(context).size;
    return  Container(
                  width: double.infinity,
                  height: size.height * 0.4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: imgfondo
                    )
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(15.0),
                        alignment: Alignment.center,
                        child: Text(titulo,style: TextStyle(color:color,fontSize: 25.0, fontWeight: FontWeight.bold)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(15.0),
                            width: 100.0,
                            height: 150.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                alignment: Alignment.center,
                                image: icono
                              )
                            ),
                          ),
                          Container(
                            width: size.width * 0.6,
                            height: 150.0,
                            alignment: Alignment.center,
                            child: Text(descripcion,style: TextStyle(color:color,fontSize: 15.0)
                          ),
                         ),
                       ],
                      )
                    ],
                  ),
                );
            
  }