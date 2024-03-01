

import 'package:flutter/material.dart';
import 'package:prueba_1/ui/cards/white_card.dart';
import 'package:prueba_1/ui/labels/custom_labels.dart';

/// PLANTILLA DE UNA VIEW

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Text('Dashboard view', style: CustomLabels.h1),

          const SizedBox(height: 30),

          const WhiteCard(
            title: 'Sales Statistics',
            child: Text('Hola Mundo!')
          )
        ],
      )
    );
  }
}