import 'package:flutter/material.dart';
import 'package:prueba_1/ui/views/login_view.dart';
import 'package:prueba_1/ui/views/widgets/background_image.dart';

class BackgroundLogin extends StatelessWidget {
  const BackgroundLogin({super.key});


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: size.height,
      child: Row(
        children: [
          const BackgrounImage(),
          LoginView( width: 600, height: size.height,)
        ],
      ),
    );
  }

}

