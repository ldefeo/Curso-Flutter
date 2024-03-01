

import 'package:flutter/material.dart';

class NavigationService {

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static goTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  static goBack() {
    return navigatorKey.currentState!.pop();
  }
}