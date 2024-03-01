import 'package:flutter/material.dart';

class CustomInputs {


  static InputDecoration loginAndRegisterDecoration({
    required String hint,
    required String label,
    IconData? icon   // --> parametro opcional (el ? lo define opcional)
  }
  ) => InputDecoration(
    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white.withOpacity(0.3))),
    enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
    hintText: hint,
    labelText: label,
    prefixIcon: Icon(icon, color: Colors.grey[900]),
    hintStyle: TextStyle(color: Colors.grey[700]),
    labelStyle: TextStyle(color: Colors.grey[700]),

  );

  static InputDecoration searchInputDecoration({
    required String hint,
    IconData? icon   // --> parametro opcional (el ? lo define opcional)
  }
  ) => InputDecoration(
    border: InputBorder.none,
    enabledBorder: InputBorder.none,
    hintText: hint,
    prefixIcon: Icon(icon, color: Colors.grey),
    hintStyle: const TextStyle(color: Colors.grey),
    labelStyle: const TextStyle(color: Colors.grey),

  );


}