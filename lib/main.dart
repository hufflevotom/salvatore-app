import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salvatore_app/Pages/pages.dart';
import 'package:salvatore_app/Services/services.dart';
import 'package:salvatore_app/Utils/Styles/styles.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginService()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Salvatore App',
      initialRoute: 'login',
      routes: {
        'login': (_) => LoginScreen(),
        'home': (_) => HomeScreen(),
        'sesion': (_) => SesionScreen(),
        'ruta': (_) => RutaScreen(),
        'folio': (_) => FolioScreen(),
        'problema': (_) => ProblemaScreen(),
        'finalizar': (_) => FinalizarScreen(),
      },
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: CustomColors.naranja_100,
          ),
          fontFamily: 'Quicksand'),
    );
  }
}
