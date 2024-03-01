


import 'package:flutter/material.dart';
import 'package:prueba_1/ui/labels/custom_labels.dart';

class WhiteCard extends StatelessWidget {

  final String? title;
  final Widget child;
  final double? width;

  const WhiteCard({super.key, this.title, required this.child, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? null,
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(10.0),
      decoration: buildBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            ...[
              FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  title!,
                  style: CustomLabels.h2,
                ),
              ),

              Divider()    // me genera una linea divisoria entre en FittedBox y el child
            ],
          child
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(5),
    boxShadow: [
      BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5),
    ]
  );
}