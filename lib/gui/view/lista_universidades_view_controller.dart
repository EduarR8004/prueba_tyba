

import 'package:prueba_tyba/core/api.dart';
import 'package:prueba_tyba/data/modelo.dart';

class UniversidadesController{
  ConexionApi conexion = ConexionApi();
  List <Root> _objetos=[];
  Future <List<Root>> listarUniversidades()async{
    List map;
    map = await conexion.callMethod('https://tyba-assets.s3.amazonaws.com/FE-Engineer-test/universities.json',[]);
    List<Root> objetos=[];
   for ( var entrada in map)
   {
     objetos.add(Root.fromJson(entrada));
   }
    return _objetos = objetos;

  }

  List <Root> obtenerUniversidades() =>_objetos;
}