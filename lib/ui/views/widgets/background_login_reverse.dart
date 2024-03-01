
import 'package:flutter/material.dart';
import 'package:prueba_1/ui/views/login_view.dart';
import 'package:prueba_1/ui/views/widgets/background_image.dart';

class BackgroundLoginReverse extends StatelessWidget {
  const BackgroundLoginReverse({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Column(
        children: [

          LoginView(width: size.width, height: 430),
          const BackgrounImage(),
        ],
      ),
    );
  }
}