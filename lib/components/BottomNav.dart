import 'package:flutter/material.dart';
import 'package:morii/views/LocalTimeline.dart';

class BottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        color: Theme.of(context).primaryColor,
        hasNotch: true,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(icon: Icon(Icons.menu), onPressed: () {
              Scaffold.of(context).openDrawer();
            },),
            IconButton(icon: Icon(Icons.home), onPressed: () {},),
            IconButton(icon: Icon(null), onPressed: null,),
            IconButton(icon: Icon(Icons.people), onPressed: () {}),
            IconButton(icon: Icon(Icons.favorite), onPressed: () {},),
          ],
        ),
      );
  }
}
