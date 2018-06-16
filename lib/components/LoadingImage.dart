import 'package:flutter/material.dart';
class LoadingImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColorDark,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * (9/16), // TODO: is this a good aspect ratio for placeholder images?
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}