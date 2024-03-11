
import 'package:flutter/material.dart';
import 'package:prueba_1/api/cafe_api.dart';
import 'package:prueba_1/models/usuario.dart';
import 'package:prueba_1/services/notifications_service.dart';

class UserFormProvider extends ChangeNotifier {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();  // para hacer las validaciones de los forms

  Usuario? user;


  copyUserWith({   // utilizo este metodo para notificar a los listener y cambiar cualquier prop que tiene el usuario
    String? nombre,
    String? correo,
    String? rol,
    bool? estado,
    bool? google,
    String? uid,
    String? img
  }) {
    user = Usuario(
      nombre: nombre ?? user!.nombre,
      correo: correo ?? user!.correo,
      rol: rol ?? user!.rol,
      estado: estado ?? user!.estado, 
      google: google ?? user!.google, 
      uid: uid ?? user!.uid
    );

    notifyListeners();

  }



  bool validForm(){
    return formKey.currentState!.validate();
  }

  Future<bool> updateUser(  ) async{

    if (!validForm()) return false;

    final data = {
      'nombre': user!.nombre,
      'correo': user!.correo
    };

    try{

      final resp = await CafeApi.httpPut('/usuarios/${user!.uid}', data);

      notifyListeners();  // reconstruye todo el build de CategoriesView porque su listen esta en true
      return true;
    }catch(e){
      NotificationsService.showNotificationError('Error en el UPDATE');
      return false;
    }
  }


}