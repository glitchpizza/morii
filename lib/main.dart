import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'package:morii/util/routing/Routes.dart'; 
import 'package:morii/util/Themes.dart';

void main() => runApp(new Morii());

class Morii extends StatefulWidget {
  @override
  MoriiState createState() {
    return new MoriiState();
  }
}

class MoriiState extends State<Morii> {
  Router router = Router();

  MoriiState() {
    Routes.configureRoutes(router);
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'morii',
      theme: lightTheme,
      onGenerateRoute: router.generator
    );
  }
}
