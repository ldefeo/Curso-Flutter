

import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:prueba_1/providers/auth_provider.dart';
import 'package:prueba_1/ui/views/auth_view.dart';
import 'package:prueba_1/ui/views/auth_views/dashboard_view.dart';
import 'package:prueba_1/ui/views/home_view.dart';
import 'package:prueba_1/ui/views/registration_view.dart';

class AdminHandler {

  static Handler principal =  Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    if (authProvider.authStatus == AuthStatus.notAuthenticated) {
      return const HomeView();
    } else {
      return const DashboardView();
    }

  });

  static Handler login = Handler(handlerFunc: (context, params) {

    return const AuthView();
  });

  static Handler registration = Handler(handlerFunc: (context, params) {

    return const RegistrationView();
  });

}