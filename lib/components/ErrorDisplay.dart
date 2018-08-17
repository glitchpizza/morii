import 'package:flutter/material.dart';

class ErrorDisplay extends StatelessWidget {
  final Object error;
  final List<String> quips = [
    "oops.",
    "aw beans.",
    "yikes."
  ];

  ErrorDisplay({this.error});

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
          Text('A network error occurred.', style: TextStyle(
            fontSize: 20.0
          )),
          Text('Please try again in a little while.', style: TextStyle(
            fontSize: 20.0
          ))
        ],
      )
    );
  }
}