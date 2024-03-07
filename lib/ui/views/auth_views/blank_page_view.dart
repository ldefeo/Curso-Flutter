

import 'package:flutter/material.dart';
import 'package:prueba_1/ui/cards/white_card.dart';
import 'package:prueba_1/ui/labels/custom_labels.dart';

class BlankPageView extends StatelessWidget {
  const BlankPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric( horizontal: 30, vertical: 40),
      child: ListView(
        children: [
          Text('Blank Page view', style: CustomLabels.h1),

          const SizedBox(height: 30),

          const WhiteCard(
            title: 'Blank page',
            child: Text('Hola, soy una pagina en blanco!!')
          )
        ],
      )
    );
  }
}