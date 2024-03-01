

import 'package:flutter/material.dart';
import 'package:prueba_1/routes/router.dart';
import 'package:prueba_1/services/local_storage.dart';
import 'package:prueba_1/services/navigation_service.dart';

enum AuthStatus {
  checking,
  authenticated,
  notAuthenticated
}

class AuthProvider extends ChangeNotifier {

  String? token;

  AuthStatus authStatus = AuthStatus.checking; // para guardar el estado de la autenticacion y hacer cosas con el.

  AuthProvider() {
    isAuthenticated();
  }
  
  
  login( String user, String password ) {

    //TODO: peticion HTTP

    token = 'afksjbnadlkfngks.hbjksfnlmxz.hbvjcskmlx';
    LocalStorage.prefs.setString('token', token!); // el ! es porque yo se que lo tengo, aunque token puede ser opcional

    authStatus = AuthStatus.authenticated;  // Esto es para navegar a otra pantalla

    notifyListeners();

    NavigationService.goTo(Flurorouter.authroute);
  }

  Future<bool> isAuthenticated() async {

    final token = LocalStorage.prefs.getString('token');

    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }    

    // TODO: ir al backend y comprobar si el JWT sigue siendo valido

    await Future.delayed(const Duration(milliseconds: 1000)); // para que se espere 1 segundo y despues me devuelva algo.

    authStatus = AuthStatus.authenticated;
    notifyListeners();
    return true;
  }

}