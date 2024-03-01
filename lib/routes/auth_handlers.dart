

import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import 'package:prueba_1/providers/auth_provider.dart';

import 'package:prueba_1/ui/views/home_auth_view.dart';
import 'package:prueba_1/ui/views/home_view.dart';

class AuthHandler {

  static Handler principal = Handler(handlerFunc: (context, params) {

    final authProvider = Provider.of<AuthProvider>(context!);

    if (authProvider.authStatus == AuthStatus.authenticated) {

      return const HomeAuthView();

    }else {
      return const HomeView();
    }
  });


}