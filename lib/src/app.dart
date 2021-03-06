import 'package:conversor_moedas/src/views/home_view.dart';
import 'package:flutter/material.dart';

class ConversorDeMoedas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeView(),
      theme: ThemeData(
        primaryColor: Colors.orange[200],
        hintColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.amber,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.amber,
            ),
          ),
          hintStyle: TextStyle(
            color: Colors.amber,
          ),
        ),
        canvasColor: Colors.black12,
        accentColor: Colors.yellow,
        fontFamily: 'PermanentMarker',
        textTheme: TextTheme(
          title: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        appBarTheme: AppBarTheme(
          color: Colors.orange[500],
          elevation: 15,
          textTheme: TextTheme(
            title: TextStyle(
              fontFamily: 'Righteous',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
