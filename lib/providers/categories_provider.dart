

import 'package:flutter/material.dart';
import 'package:prueba_1/api/cafe_api.dart';

class CategoriesProvider extends ChangeNotifier {

  List categories = [];


  getCategories() async {  // necesito llamarla cuando apenas entre a la pantalla de las categorias (en la view de la tabla)
    final resp = CafeApi.httpGet('/categorias');
    print(resp);

    notifyListeners();
  }

}