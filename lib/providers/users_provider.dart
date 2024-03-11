


import 'package:flutter/foundation.dart';
import 'package:prueba_1/api/cafe_api.dart';
import 'package:prueba_1/models/http/users_response.dart';
import 'package:prueba_1/models/usuario.dart';
import 'package:prueba_1/services/notifications_service.dart';

class UsersProvider extends ChangeNotifier {

  List<Usuario> users = [];
  bool isLoading = false;
  bool ascending = true;
  int? sortColumnIndex;  // para qu aparezca la flechita de ascendente o descendente

  UsersProvider() {
    getUsers();
  }


  getUsers() async {

    final resp = await CafeApi.httpGet('/usuarios?limite=100&desde=0');
    final usersResponse = UsersResponse.fromMap(resp);

    users = [...usersResponse.usuarios]; // para dejar las categorias que ya teniamos y agregarle las nuevas


    notifyListeners();

  }

  Future<Usuario> getUserById(String uid) async{

    try{

      final resp = await CafeApi.httpGet('/usuarios/$uid');
      final user = Usuario.fromMap(resp);

      return user;

    }catch(e){
      NotificationsService.showNotificationError('Error en el GetById');
      rethrow;
    }
  }

  void sort<T>( Comparable<T> Function(Usuario user) getField) {  // para comparar los campos de una columna x y ordenarlos

    users.sort( (a,b) {

        final aValue = getField(a);
        final bValue = getField(b);

        return ascending
        ? Comparable.compare(aValue, bValue)
        : Comparable.compare(bValue, aValue);
        
      }
    );

    ascending = !ascending;

    notifyListeners();
  }


  void updateUser( Usuario user) {   //actualizacion de la lista de usuarios

    users = users.map(
      (usuario){
        if (usuario.uid == user.uid) usuario = user;
        return usuario;
    }).toList();
  }
  
  notifyListeners();
}