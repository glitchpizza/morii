import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:morii/models/Status.dart';

import 'package:morii/components/Timeline.dart';
import 'package:morii/components/BottomNav.dart';

final String accessToken = "ACCESS_TOKEN_HERE"; // TODO: Put this into an OAath flow

Future<List<Status>> fetchStatuses() async {
  final response =
      await http.get('https://mastodon.art/api/v1/timelines/public/?only_media=true&limit=40&local=true', headers: {
        "Authorization": "Bearer $accessToken"
      });
  final List<dynamic> responseJson = json.decode(response.body);

  return responseJson.map((status) {
    return new Status.fromJson(status);
  }).where((status) => status.mediaTypes == 'image' && !status.isSensitive).toList();
}

class LocalTimeline extends StatefulWidget {
  LocalTimeline({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _LocalTimelineState createState() => new _LocalTimelineState();
}

class _LocalTimelineState extends State<LocalTimeline> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      body: Center(
        child: Timeline(statuses: fetchStatuses()) // Create a timeline with public TL posts
      ),
      bottomNavigationBar: BottomNav(),
      floatingActionButtonLocation: 
        FloatingActionButtonLocation.centerDocked,
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Color(0xFFF23438),
        foregroundColor: Colors.white,
        onPressed: (){},
        tooltip: 'New Post',
        child: new Icon(Icons.camera_alt),
        notchMargin: 4.0,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}