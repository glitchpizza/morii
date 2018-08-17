import 'package:flutter/material.dart';

final ThemeData lightTheme = new ThemeData(
      primaryColor: Colors.grey[50],
      primaryColorLight: Colors.white,
      primaryColorDark: Colors.grey[200],
      accentColor: Colors.black,
      brightness: Brightness.light,
      iconTheme: new IconThemeData(
        color: Colors.black
      ),
      fontFamily: 'Montserrat'
    );

final ThemeData darkTheme = new ThemeData(
      primaryColor: Colors.blueGrey[800],
      primaryColorLight: Colors.blueGrey[700],
      primaryColorDark: Colors.blueGrey[900],
      accentColor: Colors.white,
      brightness: Brightness.dark,
      iconTheme: new IconThemeData(
        color: Colors.white
      ),
    );

  final ThemeData oledTheme = new ThemeData(
      primaryColor: Colors.blueGrey[900],
      primaryColorLight: Colors.black,
      primaryColorDark: Colors.black,
      accentColor: Colors.white,
      brightness: Brightness.dark,
      iconTheme: new IconThemeData(
        color: Colors.white
      ),
      fontFamily: 'Montserrat'
  );