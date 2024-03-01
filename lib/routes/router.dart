

import 'package:fluro/fluro.dart';
import 'package:prueba_1/routes/admin_handlers.dart';
import 'package:prueba_1/routes/auth_handlers.dart';

class Flurorouter {

  static FluroRouter router = FluroRouter();

  static String rootroute = '/';
  static String homeroute = '/home';
  static String loginroute = '/login';
  static String registrationroute = '/registration';
  static String authroute = '/auth';
  static String iconsroute = '/auth/icons';

  static void configuredRoutes() {

    router.define(rootroute, handler: AdminHandler.principal, transitionType: TransitionType.fadeIn);

    router.define(homeroute, handler: AdminHandler.principal, transitionType: TransitionType.fadeIn);

    router.define(loginroute, handler: AdminHandler.login, transitionType: TransitionType.fadeIn);
    
    router.define(registrationroute, handler: AdminHandler.registration, transitionType: TransitionType.fadeIn);

    router.define(authroute, handler: AuthHandler.principal,  transitionType: TransitionType.none);

    router.define(iconsroute, handler: AuthHandler.icons,  transitionType: TransitionType.none);


  }


}