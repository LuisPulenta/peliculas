import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/movies_provider.dart';
import 'screens/screens.dart';

void main() => runApp(const AppState());

class MyApp extends StatelessWidget {
  static const Color primary = Colors.indigo;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Películas',
      initialRoute: 'home',
      routes: {
        'home': (_) => const HomeScreen(),
        'details': (_) => DetailsScreen(),
      },
      theme: ThemeData.light().copyWith(
        //Color primario
        primaryColor: primary,
        //AppBar Theme
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.white,
          backgroundColor: primary,
          elevation: 0,
          centerTitle: true,
        ),
      ),
    );
  }
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MoviesProvider(), lazy: false),
      ],
      child: MyApp(),
    );
  }
}
