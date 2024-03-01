

import 'package:flutter/material.dart';

class CheckingLayout extends StatelessWidget {

  const CheckingLayout({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text(
              'Checking...', 
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 12
              )
            )
          ],
        ),
      ),
    );
  }
}