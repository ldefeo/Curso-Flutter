

import 'package:flutter/material.dart';

class SideMenuProvider extends ChangeNotifier {

  static late AnimationController menuController;  // AnimationController es como si fuera un controlador de un video
  static bool isOpen = false;

  String currentPage = '';

  String getCurrentPage() {
    return currentPage;
  }

  void setCurrentPage( String routeName ) {
    currentPage = routeName;
    Future.delayed(const Duration(milliseconds: 100), () {
      notifyListeners();
    });
  }

  static Animation<double> movement = Tween<double>(begin: -200, end: 0) // -200 px porque el sidebar tiene de ancho 200 px, 
                                                                          // entonces se va colocar al lado de donde esta ahora (escondido)
                                                                  // end en 0 porque es la posicion 0 el inicio de la pestaña.
                  .animate(CurvedAnimation(parent: menuController, curve: Curves.easeInOut)); 

  static Animation<double> opacity = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: menuController, curve: Curves.easeInOut));


  static void openMenu() {
    isOpen = true;
    menuController.forward(); // le damos play a las animaciones que creamos
  }

  static void closeMenu() {
    isOpen = false;
    menuController.reverse(); // cerramos las animaciones
  }

  static void toggleMenu() { // si esta abierto, lo quiero cerrar y viceversa

    isOpen
    ? menuController.reverse()
    : menuController.forward();

    isOpen = !isOpen;
  }

}