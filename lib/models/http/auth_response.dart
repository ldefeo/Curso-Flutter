
import 'dart:convert';


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

class Usuario {
    String nombre;
    String correo;
    String rol;
    bool estado;
    bool google;
    String uid;

    Usuario({
        required this.nombre,
        required this.correo,
        required this.rol,
        required this.estado,
        required this.google,
        required this.uid,
    });

    factory Usuario.fromJson(String str) => Usuario.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Usuario.fromMap(Map<String, dynamic> json) => Usuario(
        nombre: json["nombre"],
        correo: json["correo"],
        rol: json["rol"],
        estado: json["estado"],
        google: json["google"],
        uid: json["uid"],
    );

    Map<String, dynamic> toMap() => {
        "nombre": nombre,
        "correo": correo,
        "rol": rol,
        "estado": estado,
        "google": google,
        "uid": uid,
    };
}
