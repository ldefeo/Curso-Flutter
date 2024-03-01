

import 'package:flutter/material.dart';
import 'package:prueba_1/providers/side_menu_provider.dart';
import 'package:prueba_1/ui/shared/widgets/navbar_avatar.dart';
import 'package:prueba_1/ui/shared/widgets/notifications_indicator.dart';
import 'package:prueba_1/ui/shared/widgets/search_text.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: 50,
      decoration: buildBoxDecoration(),
      child: Row(
        children: [
          // TODO: Icono del menu  --> se debe mostrar solo cuando se achica la pantalla a tal punto que el sidebar ya no se puede ver 
          if (size.width <= 700 )
          
            IconButton(onPressed: (){SideMenuProvider.openMenu();}, icon: const Icon(Icons.menu_outlined)),
          
          const SizedBox(width: 5,),
          
          // TODO: Widget para busqueda --> pasando los 400 px ya no hay tanto espacio para mostrar el SearchText
          if (size.width >= 600  )
            ConstrainedBox(  // Me permite establecer un tamaño especifico al widget que quiera
              constraints: const BoxConstraints( maxWidth: 250),
              child: const SearchText()
            ),
          const Spacer(), // toma todo el espacio restante que los widgets anteriores dejaron
          const NotificationsIndicator(),
          const SizedBox(width: 20,),
          const NavbarAvatar(),
          const SizedBox(width: 20,),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 5
      )
    ]
  );
}