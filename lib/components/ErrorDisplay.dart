import 'dart:io';

import 'package:flutter/material.dart';

class ErrorDisplay<T> extends StatelessWidget {
  final T error;
  final List<String> quips = [
    "oops.",
    "aw beans.",
    "yikes."
  ];

  ErrorDisplay({this.error});

  List<Widget> buildErrorMessage(T error) {
    if (error is SocketException) {
        SocketException e = error as SocketException;
        String resolution;
        switch (e.osError.errorCode) {
          case 7:
            resolution = 'Check your network connection.';
        }
        return [
          Text('A network error occurred. (error ${e.osError.errorCode})', style: TextStyle(
            fontSize: 20.0
          )),
          Text(resolution, style: TextStyle(
            fontSize: 20.0
          ))
        ];
    }

    return [
      Text('An unknown error has occurred.', style: TextStyle(
        fontSize: 20.0
      ))
    ];
  }

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Text((quips..shuffle()).first,
              style: TextStyle(
                fontFamily: 'Rachel',
                fontSize: 60.0, // TODO: Auto-sizing this based on text width?
                color: Color(0xFF0077FF),
              ),
            ),
          ),
        ]..addAll(buildErrorMessage(error)),
      )
    );
  }
}