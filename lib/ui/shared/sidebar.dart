

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_1/providers/auth_provider.dart';
import 'package:prueba_1/providers/side_menu_provider.dart';
import 'package:prueba_1/routes/router.dart';
import 'package:prueba_1/services/navigation_service.dart';
import 'package:prueba_1/ui/shared/widgets/logo.dart';
import 'package:prueba_1/ui/shared/widgets/menu_item.dart';
import 'package:prueba_1/ui/shared/widgets/text_separator.dart';

class Sidebar extends StatelessWidget {

  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    //final sideMenuProvider = Provider.of<SideMenuProvider>(context);
    return Container(
      width: 200,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: ListView(  // porque puedo tener varias opciones en el menu lateral, entonces con ListView puedo hacer sroll
        physics: const ClampingScrollPhysics(),
        children: [

          Logo(),
          const SizedBox(height: 50,),
          const TextSeparator(text: 'main'),
          MenuItem(text: 'dashbord', icon: Icons.dashboard_customize_outlined, isActive: isActive(context, Flurorouter.authroute), onPressed: ()=>onPressed(Flurorouter.authroute)),
          MenuItem(text: 'Orders', icon: Icons.shopping_cart_outlined, onPressed: (){}),
          MenuItem(text: 'Analythics', icon: Icons.analytics_outlined, onPressed: (){}),
          MenuItem(text: 'Categories', icon: Icons.category_outlined, onPressed: (){}),
          MenuItem(text: 'Products', icon: Icons.dashboard_outlined, onPressed: (){}),
          MenuItem(text: 'Discounts', icon: Icons.discount_outlined, onPressed: (){}),
          MenuItem(text: 'Customers', icon: Icons.people_alt_outlined, onPressed: (){}),
          const SizedBox(height: 30,),
          const TextSeparator(text: 'UI Elements'),
          MenuItem(text: 'Icons', icon: Icons.list_alt_outlined, isActive: isActive(context, Flurorouter.iconsroute), onPressed: ()=>onPressed(Flurorouter.iconsroute)),
          MenuItem(text: 'Marketing', icon: Icons.mark_email_read_outlined, onPressed: (){}),
          MenuItem(text: 'Blank Page', icon: Icons.post_add_outlined, isActive: isActive(context, Flurorouter.blankroute), onPressed: ()=>onPressed(Flurorouter.blankroute)),
          MenuItem(text: 'Campaign', icon: Icons.campaign_outlined, onPressed: (){}),
          const SizedBox(height: 30,),
          const TextSeparator(text: 'Exit'),
          MenuItem(text: 'Logout', icon: Icons.logout_outlined, onPressed: (){ Provider.of<AuthProvider>(context, listen: false).logout();}),
        ]
      ),
    );
  }

  bool isActive(BuildContext context, String route) {

    return Provider.of<SideMenuProvider>(context).getCurrentPage() == route;
  }

  void onPressed(String route) {
    NavigationService.goTo(route);
    SideMenuProvider.closeMenu();
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color.fromARGB(249, 59, 43, 117),
        Color.fromARGB(248, 54, 66, 117)
      ]
    ),
    boxShadow: [  // sombras, es una lista de BoxShadow
      BoxShadow(
        color: Colors.black26,
        blurRadius: 10
      )
    ]
  );
}