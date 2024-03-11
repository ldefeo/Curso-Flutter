import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_1/api/cafe_api.dart';
import 'package:prueba_1/providers/auth_provider.dart';
import 'package:prueba_1/providers/categories_provider.dart';
import 'package:prueba_1/providers/side_menu_provider.dart';
import 'package:prueba_1/providers/user_form_provider.dart';
import 'package:prueba_1/providers/users_provider.dart';
import 'package:prueba_1/routes/router.dart';
import 'package:prueba_1/services/local_storage.dart';
import 'package:prueba_1/services/navigation_service.dart';
import 'package:prueba_1/services/notifications_service.dart';
import 'package:prueba_1/ui/layouts/auth_layout.dart';
import 'package:prueba_1/ui/layouts/checking_layout.dart';
import 'package:prueba_1/ui/layouts/home_layout.dart';


void main() async {

  await LocalStorage.configurePrefs();
  CafeApi.configuredDio();
  Flurorouter.configuredRoutes();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [// quiero que cuando se levante la app, automaticamente empiece el proceso de autenticacion (para eso se usa lazy = false)
        ChangeNotifierProvider(lazy: false,  create: ( _ )=>AuthProvider()),

        ChangeNotifierProvider(lazy: false, create: ( _ )=>SideMenuProvider()),

        ChangeNotifierProvider(create: ( _ ) => CategoriesProvider()),

        ChangeNotifierProvider(create: ( _ ) => UsersProvider()),

        ChangeNotifierProvider(create: ( _ ) => UserFormProvider())
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
      scaffoldMessengerKey: NotificationsService.messengerKey,
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