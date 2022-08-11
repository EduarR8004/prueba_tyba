import 'package:flutter/material.dart';
import 'package:prueba_tyba/data/modelo.dart';
import 'package:prueba_tyba/gui/view/lista_universidades_view_listbuilder.dart';


class Detalle extends StatelessWidget {
  final Root resultado;
  Detalle({ this.resultado });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:new AppBar(
        backgroundColor:Colors.black,
        title: Text('Detalle',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:20,),)
      ),
      body:new SingleChildScrollView(
        child:Container(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(resultado.name,style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:30,),),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 10, 2),
                child: Text(resultado.webPages[0].toString(),style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:20,)),
              ),
            ],
          )
        ),
      ) ,
      floatingActionButton: FloatingActionButton(
        backgroundColor:Colors.black,
        onPressed: () {
          WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacement( context, MaterialPageRoute( builder: (context) => ListaUniversidades(),)); });
        },
        child:const Icon(Icons.arrow_forward),
        //backgroundColor: Color.fromRGBO(56, 124, 43, 1.0),
      ),
    );
  }
  
}