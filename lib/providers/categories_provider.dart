

import 'package:flutter/material.dart';
import 'package:prueba_1/api/cafe_api.dart';
import 'package:prueba_1/models/category.dart';
import 'package:prueba_1/models/http/categories_response.dart';

class CategoriesProvider extends ChangeNotifier {

  List<Categoria> categories = [];


  getCategories() async {  // necesito llamarla cuando apenas entre a la pantalla de las categorias (en la view de la tabla)
    final resp = await CafeApi.httpGet('/categorias');
    final categoriesResponse = CategoriesResponse.fromMap(resp);

    categories = [...categories, ...categoriesResponse.categorias]; // para dejar las categorias que ya teniamos y agregarle las nuevas

    print(categories);

    notifyListeners();
  }

}