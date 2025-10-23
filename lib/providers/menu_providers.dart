import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProviders {
  List<dynamic> options = [];
  _MenuProviders(){
    //loadData();
  }
  
  Future<List<dynamic>> loadData() async {
    final respuesta = await rootBundle.loadString('data/menu_opts.json');
    //options =  data as List<dynamic>;
    Map dataMap =  json.decode(respuesta);
    print(dataMap);
    options = dataMap['rutes'];
    return options;
  }
}
final menuProvider = _MenuProviders();