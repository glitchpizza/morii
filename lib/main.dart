import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:morii/models/Post.dart';

import 'package:morii/views/PublicTimeline.dart';

void main() => runApp(new Morii());

class Morii extends StatelessWidget {
  final ThemeData lightTheme = new ThemeData(
        primaryColor: Colors.grey[50],
        primaryColorLight: Colors.white,
        primaryColorDark: Colors.grey[200],
        accentColor: Colors.black,
        brightness: Brightness.light,
        iconTheme: new IconThemeData(
          color: Colors.blueGrey[900]
        ),
        fontFamily: 'Source Sans Pro'
      );

  final ThemeData darkTheme = new ThemeData(
        primaryColor: Colors.blueGrey[800],
        primaryColorLight: Colors.blueGrey[700],
        primaryColorDark: Colors.blueGrey[900],
        accentColor: Colors.white,
        brightness: Brightness.dark,
        iconTheme: new IconThemeData(
          color: Colors.white
        )
      );
  
    final ThemeData oledTheme = new ThemeData(
        primaryColor: Colors.blueGrey[900],
        primaryColorLight: Colors.black,
        primaryColorDark: Colors.black,
        accentColor: Colors.white,
        brightness: Brightness.dark,
        iconTheme: new IconThemeData(
          color: Colors.white
        )
    );

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'morii',
      theme: lightTheme,
      home: new PublicTimeline() // TODO: Add dynamic routing to main app
    );
  }
}
