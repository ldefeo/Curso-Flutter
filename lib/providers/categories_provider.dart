

import 'package:flutter/material.dart';
import 'package:prueba_1/api/cafe_api.dart';
import 'package:prueba_1/models/category.dart';
import 'package:prueba_1/models/http/categories_response.dart';
import 'package:prueba_1/services/notifications_service.dart';

class CategoriesProvider extends ChangeNotifier {

  List<Categoria> categories = [];


  getCategories() async {  // necesito llamarla cuando apenas entre a la pantalla de las categorias (en la view de la tabla)
    final resp = await CafeApi.httpGet('/categorias');
    final categoriesResponse = CategoriesResponse.fromMap(resp);

    categories = [...categories, ...categoriesResponse.categorias]; // para dejar las categorias que ya teniamos y agregarle las nuevas


    notifyListeners();
  }

  Future newCategory( String nombre ) async{

    final data = {
      'nombre': nombre
    };

    try{

      final json = await CafeApi.httpPost('/categorias', data);
      final newCategory = Categoria.fromMap(json);  // convierto el json en una Categoria

      categories.add(newCategory);

      notifyListeners();  // reconstruye todo el build de CategoriesView porque su listen esta en true

    }catch(e){
      NotificationsService.showNotificationError('Error en el CREATE');
    }
  }

  Future updateCategory(String id, String nombre ) async{

    final data = {
      'nombre': nombre
    };

    try{

      await CafeApi.httpPut('/categorias/$id', data);
      
      categories = categories.map(
        (categoria) {
          if ( categoria.id != id ) return categoria;
          categoria.nombre = nombre;
          return categoria;
        }
      ).toList();

      notifyListeners();  // reconstruye todo el build de CategoriesView porque su listen esta en true

    }catch(e){
      NotificationsService.showNotificationError('Error en el UPDATE');
    }
  }

  Future deleteCategory(String id ) async{


    try{

      await CafeApi.httpDelete('/categorias/$id');
      
      categories.removeWhere((categoria) => categoria.id == id);
      
      notifyListeners();  // reconstruye todo el build de CategoriesView porque su listen esta en true

    }catch(e){
      NotificationsService.showNotificationError('Error en el DELETE');
    }
  }

}