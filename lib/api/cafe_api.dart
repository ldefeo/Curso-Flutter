

import 'package:dio/dio.dart';
import 'package:prueba_1/services/local_storage.dart';

class CafeApi {

  static Dio dio = Dio();

  static void configuredDio() {

    // Base del URL
    dio.options.baseUrl = 'http://localhost:8080/api';  //cada peticion va a concatenar este url como base

    //Configurar Headers
    dio.options.headers = {
      'x-token': LocalStorage.prefs.getString('token') ?? ''
    };

  }

  static Future httpGet( String path ) async {

    try {

      final resp = await dio.get(path);
      return resp.data;

    }catch(e) {
      print(e);
      throw('ERROR');
    }

  }

  static Future httpPost( String path, Map<String,dynamic> data ) async {

    // Debemos convertir la data que llega en el body o informacion de la peticion http
    final formData = FormData.fromMap(data);

    try {

      final resp = await dio.post(path, data: formData);
      return resp.data;

    }catch(e) {
      print(e);
      throw('ERROR');
    }

  }

  static Future httpPut( String path, Map<String,dynamic> data ) async {

    // Debemos convertir la data que llega en el body o informacion de la peticion http
    final formData = FormData.fromMap(data);

    try {

      final resp = await dio.put(path, data: formData);
      return resp.data;

    }catch(e) {
      print(e);
      throw('ERROR');
    }

  }

  static Future httpDelete( String path ) async {

    try {

      final resp = await dio.delete(path);
      return resp.data;

    }catch(e) {
      print(e);
      throw('ERROR');
    }

  }

}