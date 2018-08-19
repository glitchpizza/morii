import 'dart:async';
import 'package:flutter/material.dart';

import 'package:morii/models/Status.dart';
import 'package:morii/components/FeedImage.dart';
import 'package:morii/components/ErrorDisplay.dart';


class Timeline extends StatelessWidget {
  /*
   * TODO: Should Timeline take a future list of posts or just a list of posts?
   * It feels a little icky to do future management in what should be a 
   * fairly display-based component.
   */

  final Future<List<Status>> statuses;

  Timeline({this.statuses});

  @override
  Widget build(BuildContext context) {
    // TODO: investigate using a StreamBuilder here to allow RefreshIndicator to work
    // e.g. https://blog.khophi.co/using-refreshindicator-with-flutter-streambuilder/
    return FutureBuilder<List<Status>>(
          future: statuses,
          builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  padding: EdgeInsetsDirectional.only(bottom: 64.0, top: 24.0), // To prevent weirdness with the bottom bar and transparent status bar
                  children: snapshot.data.map((status) {
                    // Create a FeedImage widget for every status in the snapshot
                    return FeedImage(status: status);
                  }).toList()
                );
              } else if (snapshot.hasError) {
                // TODO: handle errors in a more user-friendly way
                return ErrorDisplay(error: snapshot.error);
              }

              // By default, show a loading spinner
              // TODO: put this into its own fancy widget
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: Text('Loading...',
                      style: TextStyle(
                        fontFamily: 'Rachel',
                        fontSize: 60.0, // TODO: Auto-sizing this based on text width?
                      ),
                    ),
                  ),
                  CircularProgressIndicator()
                ],
              ); 
            },
        );
  }
}