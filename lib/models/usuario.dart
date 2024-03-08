import 'dart:convert';

class Usuario {
    String nombre;
    String correo;
    String rol;
    bool estado;
    bool google;
    String uid;
    String? img;

    Usuario({
        required this.nombre,
        required this.correo,
        required this.rol,
        required this.estado,
        required this.google,
        required this.uid,
        this.img
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
