

import 'package:fluro/fluro.dart';
import 'package:prueba_1/routes/admin_handlers.dart';
import 'package:prueba_1/routes/auth_handlers.dart';
import 'package:prueba_1/routes/no_page_found_handlers.dart';

class Flurorouter {

  static FluroRouter router = FluroRouter();

  static String rootroute = '/';
  static String homeroute = '/home';
  static String loginroute = '/login';
  static String registrationroute = '/registration';
  static String authroute = '/auth';
  static String iconsroute = '/auth/icons';
  static String blankroute = '/auth/blank';

  static void configuredRoutes() {

    router.define(rootroute, handler: AdminHandler.principal, transitionType: TransitionType.fadeIn);

    router.define(homeroute, handler: AdminHandler.principal, transitionType: TransitionType.fadeIn);

    router.define(loginroute, handler: AdminHandler.login, transitionType: TransitionType.fadeIn);
    
    router.define(registrationroute, handler: AdminHandler.registration, transitionType: TransitionType.fadeIn);

    router.define(authroute, handler: AuthHandler.principal,  transitionType: TransitionType.none);

    router.define(iconsroute, handler: AuthHandler.icons,  transitionType: TransitionType.none);

    router.define(blankroute, handler: AuthHandler.blank,  transitionType: TransitionType.none);

    // 404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;

  }


}