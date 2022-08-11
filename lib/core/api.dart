import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:prueba_tyba/data/modelo.dart';


class ConexionApi extends ChangeNotifier{
  Root status = Root();
  callMethod( String webservice,params)async {
    var url = Uri.parse(webservice);
    Response response;
    try{
        response = await http.get(url, headers: {
       "format": "json",
      });
      List data;
      data = jsonDecode(response.body);
      List<Map> lis = new List<Map>.from(data);
      return lis;

    }catch(e){
      return e;
    }
  }

}