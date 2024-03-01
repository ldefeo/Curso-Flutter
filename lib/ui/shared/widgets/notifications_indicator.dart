

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NotificationsIndicator extends StatelessWidget {
  const NotificationsIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(   // Nos permite colocar widgets unos encima de otros
        children: [
          Positioned(   // Nos permite ubicar el widget en la posicion que queramos sobre el otro widget
            right: 2,
            child: Container(
              width: 5,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(100)
              ),
            ),
          ),
          Icon(Icons.notifications_none_outlined, color: Colors.grey,)
        ],
      ),
    );
  }
}