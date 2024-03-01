

import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:prueba_1/providers/auth_provider.dart';
import 'package:prueba_1/providers/side_menu_provider.dart';
import 'package:prueba_1/routes/router.dart';

import 'package:prueba_1/ui/views/auth_views/dashboard_view.dart';
import 'package:prueba_1/ui/views/auth_views/icons_view.dart';
import 'package:prueba_1/ui/views/home_view.dart';

class AuthHandler {

  static Handler principal = Handler(handlerFunc: (context, params) {

    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false).setCurrentPage(Flurorouter.authroute);

    if (authProvider.authStatus == AuthStatus.authenticated) {

      return const DashboardView();

    }else {
      return const HomeView();
    }
  });

  static Handler icons = Handler(handlerFunc: (context, params) {

    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false).setCurrentPage(Flurorouter.iconsroute);

    if (authProvider.authStatus == AuthStatus.authenticated) {

      return const IconsView();

    }else {
      return const HomeView();
    }
  });


}