
import 'dart:convert';

import 'package:prueba_1/models/usuario.dart';


// Clase que tiene toda la informacion necesaria del usuario
// Solo necesito instanciar esta clase para acceder al usuario
class AuthResponse {
    Usuario usuario;
    String token;

    AuthResponse({
        required this.usuario,
        required this.token,
    });

    factory AuthResponse.fromJson(String str) => AuthResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    // El factory me permite crear una nueva instancia de Usuario en forma de json
    factory AuthResponse.fromMap(Map<String, dynamic> json) => AuthResponse(
        usuario: Usuario.fromMap(json["usuario"]),
        token: json["token"],
    );

    Map<String, dynamic> toMap() => {
        "usuario": usuario.toMap(),
        "token": token,
    };
}

