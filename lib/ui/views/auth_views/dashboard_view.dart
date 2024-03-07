

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_1/providers/auth_provider.dart';
import 'package:prueba_1/ui/cards/white_card.dart';
import 'package:prueba_1/ui/labels/custom_labels.dart';

/// PLANTILLA DE UNA VIEW

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<AuthProvider>(context).user!;

    return Container(
      padding: const EdgeInsets.symmetric( horizontal: 30, vertical: 40),
      child: ListView(
        children: [
          Text('Dashboard view', style: CustomLabels.h1),

          const SizedBox(height: 30),

          WhiteCard(
            title: user.nombre,
            child: Text(user.correo)
          )
        ],
      )
    );
  }
}