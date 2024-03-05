

import 'package:flutter/material.dart';

class NavigationService {

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static goTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  static goBack(String routeName) {
    return navigatorKey.currentState!.pushReplacementNamed( routeName );
  }
}