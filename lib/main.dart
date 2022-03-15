import 'package:flutter/material.dart';
import 'package:peliculas/screens/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const Color primary = Colors.indigo;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Películas',
      initialRoute: 'home',
      routes: {
        'home': (_) => HomeScreen(),
        'details': (_) => DetailsScreen(),
      },
      theme: ThemeData.light().copyWith(
        //Color primario
        primaryColor: primary,
        //AppBar Theme
        appBarTheme: const AppBarTheme(
          color: primary,
          elevation: 0,
          centerTitle: true,
        ),
      ),
    );
  }
}
