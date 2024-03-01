

import 'package:flutter/material.dart';
import 'package:prueba_1/ui/views/widgets/background_login.dart';
import 'package:prueba_1/ui/views/widgets/background_login_reverse.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return ListView(
        children: [
          (size.width > 1000)
          ? const BackgroundLogin()
          : const BackgroundLoginReverse()
        ],
      );
  }
}