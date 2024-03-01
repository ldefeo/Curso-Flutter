import 'package:flutter/material.dart';
import 'package:prueba_1/providers/side_menu_provider.dart';
import 'package:prueba_1/ui/shared/navbar.dart';
import 'package:prueba_1/ui/shared/sidebar.dart';


class AuthLayout extends StatefulWidget {
  final Widget child;

  const AuthLayout({
    super.key, 
    required this.child
  });

  @override
  State<AuthLayout> createState() => _AuthLayoutState();
}

class _AuthLayoutState extends State<AuthLayout> with SingleTickerProviderStateMixin{

  @override
  void initState() {
    super.initState();
    SideMenuProvider.menuController =  AnimationController(
      vsync: this, //para colocar al widget AuthLayoutState como vsync, hay que mezclarlo con SingleTickerProviderStateMixin
      duration: Duration(milliseconds: 300)
    ); 
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 215, 232, 237),
      body: Stack(   // esto es para que aparezca el menu cuando toco el icono del menu (en modo responsive)
        children: [
          Row(
            children: [
              
              //TODO: es responsive
              if (size.width > 700)  // cuando es 700 o menos me muestra el icono de menu que pusimos en el navbar
                const Sidebar(),
          
              Expanded(  // Necesito que tome todo el espacio posible
                child: Column(  // Necesito colocar el navbar y por debajo, la view
                  children: [
          
                    // Navbar
                    const Navbar(),
          
                    Expanded(child: widget.child) // Contenedor de nuestras views
                  ],
                )
              )
              
            ],
          ),

          if (size.width <= 700)
            AnimatedBuilder(      // debe ser relativamente sencillo porque se reconstruye cada vez que yo le doy play a la animacion
              animation: SideMenuProvider.menuController, 
              builder: (context, _ ) => Stack(
                children: [
                  
                  // TODO: Background del sidebar (para ocultar el sidebar cuando se abra por la animacion)
                  if (SideMenuProvider.isOpen)
                    AnimatedOpacity(
                      opacity: SideMenuProvider.opacity.value, 
                      duration: Duration(milliseconds: 200),
                      child: GestureDetector(
                        onTap: () => SideMenuProvider.closeMenu(),
                        child: Container(  // para que el gestureDetector tome toda la pantalla
                          width: size.width,
                          height: size.height,
                          color: Colors.black26,
                        ),
                      ),
                    ),


                  Transform.translate(
                    offset: Offset(SideMenuProvider.movement.value, 0), // movimiento de la animacion
                    child: const Sidebar(),
                  )
                ],
              )
            )
            //const Sidebar()
        ],
      )
    );
  }
}