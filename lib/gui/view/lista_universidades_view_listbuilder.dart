import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:prueba_tyba/data/modelo.dart';
import 'package:prueba_tyba/gui/view/lista_universidad_view_detalle.dart';

import 'package:prueba_tyba/gui/view/lista_universidades_view_controller.dart';



class ListaUniversidades extends StatefulWidget {

  @override
  State<ListaUniversidades> createState() => _ListaUniversidadesState();
}

class _ListaUniversidadesState extends State<ListaUniversidades> {
  List<Root> resultados=[];
  UniversidadesController controlador = UniversidadesController();
  @override
    void initState() {
      listarResultados();
      super.initState();
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:new AppBar(
        backgroundColor:Colors.black,
        title: Text('Lista',style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:20,),)
      ),
      body:Container(
        //color: Colors.black,
        child: Center(child:body())
      ) ,
    );
  }
  
  Future <List<Root>> listarResultados()async{
    await controlador.listarUniversidades().then((_){
      List<Root> preResultados=controlador.obtenerUniversidades();
      for ( Root resultado in preResultados)
      {
        resultados.add(resultado);
      }        
    });
    return resultados;
  }

  Widget body(){
    return Column(
      children: [
        Expanded(
          child:Container(
            //color: Colors.black,
            width:360,
            child:listaComics()
          )   
        )
      ],
    );
  }

  FutureBuilder<List<Root>> listaComics() {
    return FutureBuilder<List<Root>>(
      future: listarResultados(),
      builder: (BuildContext context, AsyncSnapshot<List<Root>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index){
              Root item = snapshot.data[index];
              return cardCuenta(item);
            },
          );
        }else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget cardCuenta(Root item){
    return 
    Card(
      child:Container(
        height: 80,
        child: ListTile(
          title: Text(item.name,style: TextStyle(fontWeight:FontWeight.bold,color: Colors.black,fontSize:18,)),
          subtitle:Text(item.alphaTwoCode),
          onTap: () {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacement( context, MaterialPageRoute( builder: (context) => Detalle(resultado: item,),)); });
          }
        ),
      )
    );
  }
}