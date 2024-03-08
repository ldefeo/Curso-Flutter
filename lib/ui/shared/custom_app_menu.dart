
import 'package:flutter/material.dart';
import 'package:prueba_1/routes/router.dart';
import 'package:prueba_1/services/navigation_service.dart';

class CustomAppMenu extends StatelessWidget {
  const CustomAppMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: buildBoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FilledButton(
                onPressed: ()=>NavigationService.replaceTo(Flurorouter.homeroute), 
                child: const Icon(Icons.home, size: 20.0,)
              ),
              const SizedBox(width: 10.0),
              FilledButton(
                onPressed: ()=>NavigationService.replaceTo(Flurorouter.loginroute),
                child: const Icon(Icons.login, size: 20.0,)
              ),
              const SizedBox(width: 10.0),
              FilledButton(
                onPressed: ()=>NavigationService.replaceTo(Flurorouter.registrationroute),
                child: const Icon(Icons.app_registration, size: 20.0,)
              )
            ],
          ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.redAccent,
            Colors.greenAccent,
            Colors.orangeAccent
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomLeft,
        ),
      );
  }
}