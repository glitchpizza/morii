import 'package:flutter/material.dart';

class ErrorDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Text('oops.',
              style: TextStyle(
                fontFamily: 'Rachel',
                fontSize: 80.0,
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