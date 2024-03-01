import 'package:flutter/material.dart';
import 'package:prueba_1/ui/shared/custom_app_menu.dart';


class HomeLayout extends StatelessWidget {
  final Widget child;

  const HomeLayout({
    super.key, 
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomAppMenu(),
                Expanded(child: child),
              ],
            ),
      ),
    );
  }
}