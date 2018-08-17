import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:morii/models/Status.dart';
import 'package:morii/models/Account.dart';

import 'package:morii/components/BottomNav.dart';

final String accessToken = "ACCESS_TOKEN_HERE"; // TODO: Put this into an OAath flow

// TODO: Fetch account, posts

class Profile extends StatefulWidget {
  Profile({
      Key key,
      @required this.account
    }) : super(key: key);

  final Account account;

  @override
  createState() => new _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      body: Center(
        child: Placeholder()
      ),
      bottomNavigationBar: BottomNav(),
      floatingActionButtonLocation: 
        FloatingActionButtonLocation.centerDocked,
      floatingActionButton: new FloatingActionButton(
        onPressed: (){},
        tooltip: 'New Post',
        child: new Icon(Icons.camera_alt),
        notchMargin: 4.0,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}