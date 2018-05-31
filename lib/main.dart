import 'package:flutter/material.dart';
import 'components/FeedImage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  final ThemeData lightTheme = new ThemeData(
        primaryColor: Colors.grey[50],
        primaryColorLight: Colors.white,
        primaryColorDark: Colors.grey[200],
        accentColor: Colors.blueGrey[900],
        brightness: Brightness.light,
        iconTheme: new IconThemeData(
          color: Colors.blueGrey[900]
        )
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
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'morii',
      theme: lightTheme,
      home: new MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      body: new Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: new ListView(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug paint" (press "p" in the console where you ran
          // "flutter run", or select "Toggle Debug Paint" from the Flutter tool
          // window in IntelliJ) to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          children: <Widget>[
            new FeedImage()
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColor,
        hasNotch: true,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(icon: Icon(Icons.menu), onPressed: () {},),
            IconButton(icon: Icon(Icons.favorite), onPressed: () {},),
            IconButton(icon: Icon(null), onPressed: null,),
            IconButton(icon: Icon(Icons.public), onPressed: () {},),
            IconButton(icon: Icon(Icons.person), onPressed: () {},),
          ],
        ),
      ),
      floatingActionButtonLocation: 
        FloatingActionButtonLocation.centerDocked,
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.camera_alt),
        notchMargin: 4.0,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
