

import 'package:flutter/material.dart';

class BackgrounImage extends StatelessWidget {
  const BackgrounImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('lib/assets/images/juego.jpg'), fit: BoxFit.cover),
        ),
        child: Stack(
          children: [Positioned(
            top: 20,
            right: 20,
            child: Image.asset('lib/assets/images/sol.png', width: 200, height: 200,)
          ),]
        ),
      ),
    );
  }
}