import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_1/providers/auth_provider.dart';
import 'package:prueba_1/providers/side_menu_provider.dart';
import 'package:prueba_1/routes/router.dart';
import 'package:prueba_1/services/local_storage.dart';
import 'package:prueba_1/services/navigation_service.dart';
import 'package:prueba_1/ui/layouts/auth_layout.dart';
import 'package:prueba_1/ui/layouts/checking_layout.dart';
import 'package:prueba_1/ui/layouts/home_layout.dart';


void main() async {

  await LocalStorage.configurePrefs();
  Flurorouter.configuredRoutes();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,  // quiero que cuando se levante la app, automaticamente empiece el proceso de autenticacion
          create: (_)=>AuthProvider()
        ),

        ChangeNotifierProvider(
          lazy: false,  // quiero que cuando se levante la app, automaticamente empiece el proceso de autenticacion
          create: (_)=>SideMenuProvider()
        ),
      ],
      child: const HomeApp(),
    );
  }
}

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Landing page',
      initialRoute: Flurorouter.rootroute,
      navigatorKey: NavigationService.navigatorKey,
      onGenerateRoute: Flurorouter.router.generator,
      builder: ( _ , child ) {

        final authProvider = Provider.of<AuthProvider>(context);

        if (authProvider.authStatus == AuthStatus.checking) {
          return const CheckingLayout();
        }

        if (authProvider.authStatus == AuthStatus.authenticated) {
          return AuthLayout(child: child!);
        }

        else {
          return HomeLayout(child: child!);
        }

      },
      theme: ThemeData.light().copyWith(
        scrollbarTheme: const ScrollbarThemeData().copyWith(
          thumbColor: const MaterialStatePropertyAll(Colors.blueGrey)
        )
      ),
    );
  }
}