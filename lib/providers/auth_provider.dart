

import 'package:flutter/material.dart';
import 'package:prueba_1/api/cafe_api.dart';
import 'package:prueba_1/models/http/auth_response.dart';
import 'package:prueba_1/models/usuario.dart';
import 'package:prueba_1/routes/router.dart';
import 'package:prueba_1/services/local_storage.dart';
import 'package:prueba_1/services/navigation_service.dart';
import 'package:prueba_1/services/notifications_service.dart';

enum AuthStatus {
  checking,
  authenticated,
  notAuthenticated
}

class AuthProvider extends ChangeNotifier {

  String? token;

  AuthStatus authStatus = AuthStatus.checking; // para guardar el estado de la autenticacion y hacer cosas con el.

  Usuario? user;

  AuthProvider() {
    isAuthenticated();
  }
  
  
  login( String email, String password ) {

    final data = {
      'correo': email,
      'password': password
    };

    CafeApi.httpPost('/auth/login', data).then((json) {

      final authResponse = AuthResponse.fromMap(json);
      user = authResponse.usuario;  // obtengo el usuario que ya esta autenticado
      authStatus = AuthStatus.authenticated;  // Esto es para navegar a otra pantalla
      LocalStorage.prefs.setString('token', authResponse.token); // token viene del response de la autenticacion del usuario
      NavigationService.replaceTo(Flurorouter.authroute);
      notifyListeners();
    }
    
    ).catchError((e) {
      NotificationsService.showNotificationError( 'Usuario / Contraseña inválidos' );
    });
  }

  register( String name, String email, String password ) {

    final data = {
      'nombre': name,
      'correo': email,
      'password': password
    };

    //En el path debemos mandar solo la continuacion de la baseUrl que creamos en CafeApi
    CafeApi.httpPost('/usuarios', data).then(
      (json) {

        final authResponse = AuthResponse.fromMap(json);
        user = authResponse.usuario;  // obtengo el usuario que ya esta autenticado
        authStatus = AuthStatus.authenticated;  // Esto es para navegar a otra pantalla
        LocalStorage.prefs.setString('token', authResponse.token); // token viene del response de la autenticacion del usuario
        NavigationService.replaceTo(Flurorouter.authroute);

        CafeApi.configuredDio(); // Necesito llamarlo para que el token generado sea el mismo en cada peticion

        notifyListeners();
      }
    ).catchError((e) {
      NotificationsService.showNotificationError( 'Usuario / Contraseña inválidos' );
    });
    

    

  }

  Future<bool> isAuthenticated() async {

    final token = LocalStorage.prefs.getString('token');

    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }    

    try {

      final resp = await CafeApi.httpGet('/auth'); // como la respuesta luce igual al AuthResponse que generamos, entonces la convertimos en uno
      final authResponse = AuthResponse.fromMap(resp);

      user = authResponse.usuario;

      authStatus = AuthStatus.authenticated;
      notifyListeners();
      return true;

    }catch(e) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
  }

  logout() {
    LocalStorage.prefs.remove('token');
    authStatus = AuthStatus.notAuthenticated;
    notifyListeners();
  }

}